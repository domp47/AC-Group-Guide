extern crate base64;

use rocket::Outcome;
use rocket::http::Status;
use rocket::request::{self, Request, FromRequest};


use serde::{Deserialize, Serialize};

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
    auth_time: i32,
    user_id: String,
    sub: String,
    iat: i32,
    exp: i32,
    email: String,
    email_verified: bool
}

/**
 * Requirements Taken From Here: https://firebase.google.com/docs/auth/admin/verify-id-tokens
 **/
pub fn verify_firebase_jwt(jwt: String) -> () {
    let parts: Vec<String> = jwt.split(".").map(|s| s.to_string()).collect();

    assert_eq!(parts.len(), 3, "Unrecognize JWT Token");

    let header_vec = base64::decode(&parts[0]).unwrap();
    let body_vec = base64::decode(&parts[1]).unwrap();

    let header_str = std::str::from_utf8(&header_vec).unwrap();
    let body_str = std::str::from_utf8(&body_vec).unwrap();

    let header: Header = serde_json::from_str(header_str).unwrap();
    let body: Payload = serde_json::from_str(body_str).unwrap();



    if header.alg != "RS256" {
        println!("ERROR!!!!!");
    }

    /**
     * TODO HTTP Get to https://www.googleapis.com/robot/v1/metadata/x509/securetoken@system.gserviceaccount.com
     * and find if the kid is in there.
     *
     **/

    let start = std::time::SystemTime::now();
    let since_epoch = start.duration_since(std::time::UNIX_EPOCH).expect("Time went backwards").as_secs();

    if std::time::SystemTime::now().as_secs() > body.exp {
        println!("ERROR!!!!!");
    }
}