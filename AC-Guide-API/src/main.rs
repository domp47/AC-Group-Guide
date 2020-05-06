#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use] extern crate rocket;
#[macro_use] extern crate serde_derive;
#[macro_use] extern crate diesel;

extern crate rocket_contrib;
extern crate r2d2;
extern crate r2d2_diesel;

mod db;
mod schema;
mod collectable;
mod constants;

use rocket_contrib::json::Json;
use rocket_contrib::json::JsonValue;
use rocket_contrib::json;
use dotenv;

#[get("/")]
fn get_collect(connection: db::Connection) -> Json<JsonValue> {
    Json(json!(collectable::Collectable::get_caught(constants::CollectableTypeEnum::Art, 1, &connection)))
}

fn main() {
    #[cfg(debug_assertions)]
    dotenv::dotenv().ok(); //Only loads .env file when compiled in debug mode.

    rocket::ignite()
        .manage(db::connect())
        .mount("/collectables", routes![get_collect])
        .launch();
}

//TODO change the schema cuz a user can not be in a group but must be assigned a role to a group?? oops.