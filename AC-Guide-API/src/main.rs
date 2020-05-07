#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use] extern crate rocket;
#[macro_use] extern crate serde_derive;
#[macro_use] extern crate diesel;

extern crate rocket_contrib;
extern crate r2d2;
extern crate r2d2_diesel;

mod auth;
mod db;
mod schema;
mod collectable;
mod collected_item;
mod constants;

use rocket_contrib::json::Json;
use rocket_contrib::json::JsonValue;
use rocket_contrib::json;
use dotenv;

// region ReturnModels
#[derive(Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
struct Art {
    name: String,
    img_location: String,
    price: i32,
    original: String,
    artist: String,
    img_location_alt: Option<String>
}

#[derive(Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
struct Bug {
    name: String,
    img_location: String,
    price: i32,
    location: String,
    north_label: String,
    south_label: String,
    time_label: String
}

#[derive(Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
struct Fish {
    name: String,
    img_location: String,
    price: i32,
    location: String,
    north_label: String,
    south_label: String,
    time_label: String,
    shadow_size: String
}

#[derive(Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
struct Fossil {
    name: String,
    img_location: String,
    price: i32,
}

#[derive(Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
struct TrackingResponse {
    missing_art: Vec<Art>,
    acquired_art: Vec<Art>,

    avail_now_bugs: Vec<Bug>,
    avail_later_bugs: Vec<Bug>,
    not_avail_bugs: Vec<Bug>,
    caught_bugs: Vec<Bug>,

    avail_now_fish: Vec<Fish>,
    avail_later_fish: Vec<Fish>,
    not_avail_fish: Vec<Fish>,
    caught_fish: Vec<Fish>,

    missing_fossils: Vec<Art>,
    acquired_fossils: Vec<Art>,
}

// endregion


// region Tracking

//#[get("/<user_id>")]
//fn get_tracking(user_id: i32, connection: db::Connection) -> Json<JsonValue> {
//
//}

// endregion

fn main() {
    #[cfg(debug_assertions)]
    dotenv::dotenv().ok(); //Only loads .env file when compiled in debug mode.

//    rocket::ignite()
//        .manage(db::connect())
//        .launch();
}

//TODO change the schema cuz a user can not be in a group but must be assigned a role to a group?? oops.