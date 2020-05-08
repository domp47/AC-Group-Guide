extern crate base64;

use rocket::Outcome;
use rocket::http::Status;
use rocket::request::{self, Request, FromRequest};
use std::collections::HashMap;
use serde::{Deserialize, Serialize};
use openssl::x509;
use openssl::rsa;
use openssl::sha;

#[derive(Serialize, Deserialize)]
struct Header {
    alg: String,
    kid: String,
    typ: String
}

#[derive(Serialize, Deserialize)]
struct Payload {
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

    let mut x509_cert: x509::X509;
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

    verifier.update(message.as_bytes());

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
pub fn verify_firebase_jwt(jwt: String) -> () {
    let parts: Vec<String> = jwt.split(".").map(|s| s.to_string()).collect();
    let mut firebase_project = "".to_string();
    match std::env::var("FIREBASE_ID") {
        Ok(val) => firebase_project = val,
        Err(e) => println!("couldn't get firebase id from env variable 'FIREBASE_ID': {}", e)
    }

    assert_eq!(parts.len(), 3, "Unrecognize JWT Token");

    let header_vec = base64::decode(&parts[0]).unwrap();
    let body_vec = base64::decode(&parts[1]).unwrap();

    let header_str = std::str::from_utf8(&header_vec).unwrap();
    let body_str = std::str::from_utf8(&body_vec).unwrap();

    let header: Header = serde_json::from_str(header_str).unwrap();
    let body: Payload = serde_json::from_str(body_str).unwrap();



    if header.alg != "RS256" {
        println!("ERROR!!!!!: Alg");
    }

    let pub_keys = reqwest::blocking::get("https://www.googleapis.com/robot/v1/metadata/x509/securetoken@system.gserviceaccount.com").unwrap()
        .json::<HashMap<String, String>>().unwrap();

    if !pub_keys.contains_key(&header.kid) {
        println!("ERROR!!!!!: No Pub Key");
    }

    let start = std::time::SystemTime::now();
    let since_epoch = start.duration_since(std::time::UNIX_EPOCH).expect("Time went backwards").as_secs();

    if since_epoch > body.exp {
        println!("ERROR!!!!!: Expired");
    }

    if since_epoch < body.iat {
        println!("ERROR!!!!!: Fake issued Time");
    }

    if firebase_project != body.aud {
        println!("ERROR!!!!!: wrong firebase");
    }

    if std::format!("https://securetoken.google.com/{}", firebase_project) != body.iss {
        println!("ERROR!!!!!: wrong issuer");
    }

    if body.sub != body.user_id || body.sub.is_empty(){
        println!("ERROR!!!!!: subject is wrong");
    }

    if since_epoch < body.auth_time {
        println!("ERROR!!!!!: auth time is fake");
    }

    if ! verify_signature(format!("{}.{}", parts[0], parts[1]), pub_keys.get(&header.kid).unwrap(), &parts[2]) {
        println!("ERROR!!!!!: signature not valid");
    }

}