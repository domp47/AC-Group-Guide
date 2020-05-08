extern crate base64;

use rocket::Outcome;
use rocket::http::Status;
use rocket::request::{self, Request, FromRequest};
use std::collections::HashMap;
//use serde::{Deserialize, Serialize};
use openssl::x509;
//use openssl::rsa;
//use openssl::sha;
use diesel::pg::PgConnection;

use crate::ac_user::AcUser;

#[derive(Serialize, Deserialize)]
pub struct Header {
    alg: String,
    kid: String,
    typ: String
}

#[derive(Serialize, Deserialize)]
pub struct Payload {
    name: String,
    picture: String,
    iss: String,
    aud: String,
    auth_time: u64,
    user_id: String,
    sub: String,
    iat: u64,
    exp: u64,
    email: String,
    email_verified: bool
}


pub fn verify_signature(message: String, cert: &String, signature: &String) -> bool {

    let x509_cert: x509::X509;
    match x509::X509::from_pem(cert.as_bytes()) {
        Ok(v) => x509_cert = v,
        Err(err) => {
            println!("Error Parsing Cert: {}", err);
            return false
        }
    };

    let pub_key: openssl::pkey::PKey<openssl::pkey::Public>;
    match x509_cert.public_key() {
        Ok(v) => pub_key = v,
        Err(err) => {
            println!("Error Getting Public Key: {}", err);
            return false
        }
    };

    let sig_bytes: Vec<u8>;
    match base64::decode_config(signature, base64::URL_SAFE) {
        Ok(v) => sig_bytes = v,
        Err(err) => {
            println!("Error Decoding Signature: {}", err);
            return false
        }
    };

    let mut verifier: openssl::sign::Verifier;
    match openssl::sign::Verifier::new(openssl::hash::MessageDigest::sha256(), &pub_key) {
        Ok(v) => verifier = v,
        Err(err) => {
            println!("Error Creating OpenSSL Verifier: {}", err);
            return false
        }
    };

    let res = verifier.update(message.as_bytes());
    if res.is_err() {
        println!("Error Adding Signature to Verification");
        return false
    }

    match verifier.verify(&sig_bytes) {
        Ok(v) => return v,
        Err(err) => {
            println!("Error Verifying Signature: {}", err);
            return false
        }
    };
}

/**
 * Requirements Taken From Here: https://firebase.google.com/docs/auth/admin/verify-id-tokens
 **/
pub fn verify_firebase_jwt(jwt: &str) -> Result<Payload, String> {
    let parts: Vec<String> = jwt.split(".").map(|s| s.to_string()).collect();
    let firebase_project;
    match std::env::var("FIREBASE_ID") {
        Ok(val) => firebase_project = val,
        Err(e) => {
            let err_message = format!("couldn't get firebase id from env variable 'FIREBASE_ID': {}", e);
            return Err(err_message)
        }
    }

    assert_eq!(parts.len(), 3, "Unrecognized JWT Token");
    if parts.len() != 3 {
        return Err("Token Verification Error: token is not 3 parts.".to_string())

    }

    let header_vec_res = base64::decode(&parts[0]);
    let body_vec_res = base64::decode(&parts[1]);
    if header_vec_res.is_err() || body_vec_res.is_err() {
        return Err("Token Verification Error: Could not b64 decode the token.".to_string())

    }
    let header_vec = header_vec_res.unwrap();
    let body_vec = body_vec_res.unwrap();

    let header_str_res = std::str::from_utf8(&header_vec);
    let body_str_res = std::str::from_utf8(&body_vec);
    if header_str_res.is_err() || body_str_res.is_err() {
        return Err("Token Verification Error: Could not convert decoded bytes to a string.".to_string())

    }
    let header_str = header_str_res.unwrap();
    let body_str = body_str_res.unwrap();

    let header_res = serde_json::from_str(header_str);
    let body_res = serde_json::from_str(body_str);
    if header_res.is_err() || body_res.is_err() {
        return Err("Token Verification Error: Could not serialize the token.".to_string())

    }
    let header: Header = header_res.unwrap();
    let body: Payload = body_res.unwrap();

    if header.alg != "RS256" {
        return Err("Token Verification Error: Header Algorithm is not RSA256.".to_string())

    }


    let req_resp = reqwest::blocking::get("https://www.googleapis.com/robot/v1/metadata/x509/securetoken@system.gserviceaccount.com");
    if req_resp.is_err() {
        return Err("Token Verification Error: Could not get Google's Public Keys.".to_string())

    }
    let pub_keys_res = req_resp.unwrap().json::<HashMap<String, String>>();
    if pub_keys_res.is_err() {
        return Err("Token Verification Error: Could not serialize Google's Public Keys response.".to_string())

    }
    let pub_keys = pub_keys_res.unwrap();

    if !pub_keys.contains_key(&header.kid) {
        let error_message = format!("Token Verification Error: Google Public Keys don't contain the specified kid: {}.", header.kid);
        return Err(error_message)

    }

    let start = std::time::SystemTime::now();
    let since_epoch = start.duration_since(std::time::UNIX_EPOCH).expect("Time went backwards").as_secs();

    if since_epoch > body.exp {
        return Err("Token Verification Error: Expired.".to_string())

    }

    if since_epoch < body.iat {
        return Err("Token Verification Error: Issued Time is in the past.".to_string())

    }

    if firebase_project != body.aud {
        return Err("Token Verification Error: Firebase Project Id is wrong.".to_string())

    }

    if std::format!("https://securetoken.google.com/{}", firebase_project) != body.iss {
        return Err("Token Verification Error: Incorrect Issuer.".to_string())

    }

    if body.sub != body.user_id || body.sub.is_empty(){
        return Err("Token Verification Error: Incorrect Subject.".to_string())

    }

    if since_epoch < body.auth_time {
        return Err("Token Verification Error: Authorization time cannot be in the past.".to_string())

    }

    if ! verify_signature(format!("{}.{}", parts[0], parts[1]), pub_keys.get(&header.kid).unwrap(), &parts[2]) {
        return Err("Token Verification Error: Invalid Signature.".to_string())

    }

    return Ok(body)
}

pub fn get_ac_user_from_auth(auth: Payload, connection: &PgConnection) -> AcUser {
    let user_id = auth.sub;
    let user = AcUser::get_user(user_id.clone(), connection);

    if ! user.is_default() {
        return user
    }

    let new_user = AcUser { google_id: user_id, display_name: auth.name, group_id: None, role_id: None };

    AcUser::create(new_user, connection)
}

#[derive(Debug)]
pub enum ApiKeyError {
    Denied,
    DbConnectionError
}

impl<'a, 'r> FromRequest<'a, 'r> for AcUser {
    type Error = ApiKeyError;

    fn from_request(request: &'a Request<'r>) -> request::Outcome<Self, Self::Error> {
        let db_outcome = request.guard::<crate::db::Connection>();
        if ! db_outcome.is_success() {
            return Outcome::Failure((Status::FailedDependency, ApiKeyError::DbConnectionError))
        }
        let db = db_outcome.unwrap();

        let keys: Vec<_> = request.headers().get("authorization").collect();

        if keys.len() == 1 {
            let res = verify_firebase_jwt(keys[0]);
            match res {
                Ok(p) => {
                    return Outcome::Success(get_ac_user_from_auth(p, &db))
                }
                Err(err) => {
                    println!("{}", err);
                    return Outcome::Failure((Status::Forbidden, ApiKeyError::Denied))
                }
            }
        }else{
            return Outcome::Failure((Status::Forbidden, ApiKeyError::Denied))
        }
    }
}



























