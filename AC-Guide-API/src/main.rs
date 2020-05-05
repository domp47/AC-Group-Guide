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

use rocket_contrib::json::Json;
use rocket_contrib::json::JsonValue;
use rocket_contrib::json;
use dotenv;

#[get("/<name>/<age>")]
fn hello(name: String, age: u8) -> String {
    format!("Hello, {} year old named {}!", age, name)
}

#[get("/")]
fn get_collect(connection: db::Connection) -> Json<JsonValue> {
    Json(json!(collectable::Collectable::read(&connection)))
}

fn main() {
    #[cfg(debug_assertions)]
    dotenv::dotenv().ok(); //Only loads .env file when compiled in debug mode.

    rocket::ignite()
        .manage(db::connect())
        .mount("/hello", routes![hello])
        .mount("/collectables", routes![get_collect])
        .launch();
}