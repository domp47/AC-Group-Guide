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

mod ac_user;
mod collectable;
mod collected_item;
mod group;

mod constants;

use rocket_contrib::json::Json;
use rocket_contrib::json::JsonValue;
use rocket_contrib::json;
use dotenv;

// region AcceptModels

#[derive(Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
struct GetTracking {
    month: i32,
    hour: i32,
    hemisphere: bool
}

#[derive(Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
struct JoinGroup {
    code: String
}

#[derive(Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
struct CreateGroup {
    name: String
}

// endregion

// region ReturnModels
#[derive(Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
struct RespMessage{
    message: String
}

#[derive(Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
struct Art {
    id: i32,
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
    id: i32,
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
    id: i32,
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
    id: i32,
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

    missing_fossils: Vec<Fossil>,
    acquired_fossils: Vec<Fossil>,
}

#[derive(Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
struct HomeResponse {
    display_name: String,

    missing_art: Vec<Art>,
    missing_bugs: Vec<Bug>,
    missing_fish: Vec<Fish>,
    missing_fossils: Vec<Fossil>
}

// endregion

// region ConversionFunction


fn get_art(item: &collectable::Collectable) -> Art{
    Art { id: item.id, name: item.display_name.clone(), img_location: item.img_location.clone(), price: item.price, original: item.original.as_ref().unwrap().to_string(), artist: item.artist.as_ref().unwrap().to_string(), img_location_alt: item.img_location_alt.clone()}
}

fn get_art_list(items: Vec<collectable::Collectable>) -> Vec<Art> {
    let mut resp = Vec::new();

    for item in items.iter() {
        let art = get_art(item);
        resp.push(art);
    }

    resp
}

fn get_bug(item: &collectable::Collectable) -> Bug {
    Bug { id: item.id, name: item.display_name.clone(), img_location: item.img_location.clone(), price: item.price, location: item.spawn_location.as_ref().unwrap().to_string(), north_label: item.north_label.as_ref().unwrap().to_string(), south_label: item.south_label.as_ref().unwrap().to_string(), time_label: item.time_label.as_ref().unwrap().to_string()}
}


fn get_bug_list(items: Vec<collectable::Collectable>) -> Vec<Bug> {
    let mut resp = Vec::new();

    for item in items.iter() {
        let bug = get_bug(item);
        resp.push(bug);
    }

    resp
}

fn get_fish(item: &collectable::Collectable) -> Fish {
    Fish { id: item.id, name: item.display_name.clone(), img_location: item.img_location.clone(), price: item.price, location: item.spawn_location.as_ref().unwrap().to_string(), north_label: item.north_label.as_ref().unwrap().to_string(), south_label: item.south_label.as_ref().unwrap().to_string(), time_label: item.time_label.as_ref().unwrap().to_string(), shadow_size: item.shadow_size.as_ref().unwrap().to_string() }
}


fn get_fish_list(items: Vec<collectable::Collectable>) -> Vec<Fish> {
    let mut resp = Vec::new();

    for item in items.iter() {
        let fish = get_fish(item);
        resp.push(fish);
    }

    resp
}

fn get_fossil(item: &collectable::Collectable) -> Fossil {
    Fossil { id: item.id, name: item.display_name.clone(), img_location: item.img_location.clone(), price: item.price }
}

fn get_fossil_list(items: Vec<collectable::Collectable>) -> Vec<Fossil> {
    let mut resp = Vec::new();

    for item in items.iter() {
        let fossil = get_fossil(item);
        resp.push(fossil);
    }

    resp
}

// endregion

// region Tracking

/** This Gets all the tracking items for a user
 *
 *    Must Pass in:
 *    Month: number between 1-12
 *    Hour: number between 0-23
 *    Hemisphere: true: north, false: south
 **/
#[post("/get", data = "<info>")]
fn get_tracking(info: Json<GetTracking>, connection: db::Connection, user: ac_user::AcUser) -> Json<JsonValue> {
    let month = info.month;
    let hour = info.hour;

    if month < 1 || month > 12 {
        return Json(json!(RespMessage { message: "Error: Invalid Month. Must be between 1-12".to_string() }))
    }
    if hour < 0 || hour > 23 {
        return Json(json!(RespMessage { message: "Error: Invalid Hour. Must be between 0-23".to_string() }))
    }

    let m_mask = 1 << (12 - month);
    let h_mask = 1 << (23 - hour);

    let resp = TrackingResponse {
        missing_art: get_art_list(collectable::Collectable::get_always_avail(constants::CollectableTypeEnum::Art, user.google_id.clone(), &connection)),
        acquired_art: get_art_list(collectable::Collectable::get_caught(constants::CollectableTypeEnum::Art, user.google_id.clone(), &connection)),

        avail_now_bugs: get_bug_list(collectable::Collectable::get_timed_now(constants::CollectableTypeEnum::Bug, user.google_id.clone(), m_mask, h_mask, info.hemisphere, &connection )),
        avail_later_bugs: get_bug_list(collectable::Collectable::get_timed_this_month(constants::CollectableTypeEnum::Bug, user.google_id.clone(), m_mask, h_mask, info.hemisphere, &connection )),
        not_avail_bugs: get_bug_list(collectable::Collectable::get_timed_not_avail(constants::CollectableTypeEnum::Bug, user.google_id.clone(), m_mask, info.hemisphere, &connection )),
        caught_bugs: get_bug_list(collectable::Collectable::get_caught(constants::CollectableTypeEnum::Bug, user.google_id.clone(), &connection)),

        avail_now_fish: get_fish_list(collectable::Collectable::get_timed_now(constants::CollectableTypeEnum::Fish, user.google_id.clone(), m_mask, h_mask, info.hemisphere, &connection )),
        avail_later_fish: get_fish_list(collectable::Collectable::get_timed_this_month(constants::CollectableTypeEnum::Fish, user.google_id.clone(), m_mask, h_mask, info.hemisphere, &connection )),
        not_avail_fish: get_fish_list(collectable::Collectable::get_timed_not_avail(constants::CollectableTypeEnum::Fish, user.google_id.clone(), m_mask, info.hemisphere, &connection )),
        caught_fish: get_fish_list(collectable::Collectable::get_caught(constants::CollectableTypeEnum::Fish, user.google_id.clone(), &connection)),

        missing_fossils: get_fossil_list(collectable::Collectable::get_always_avail(constants::CollectableTypeEnum::Fossil, user.google_id.clone(), &connection)),
        acquired_fossils: get_fossil_list(collectable::Collectable::get_caught(constants::CollectableTypeEnum::Fossil, user.google_id.clone(), &connection))
    };

    Json(json!(resp))
}

#[put("/<id>")]
fn catch_item(id: i32, connection: db::Connection, user: ac_user::AcUser) -> Json<JsonValue> {
    let item = collected_item::CollectedItem { user_id: user.google_id, collectable_id: id };
    collected_item::CollectedItem::create(item, &connection);

    Json(json!(RespMessage { message: "ok".to_string()}))
}

#[delete("/<id>")]
fn uncatch_item(id: i32, connection: db::Connection, user: ac_user::AcUser) -> Json<JsonValue> {
    collected_item::CollectedItem::delete(user.google_id, id, &connection);

    Json(json!(RespMessage { message: "ok".to_string()}))
}

// endregion

// region Group

#[post("/join", data = "<info>")]
fn group_join(info: Json<JoinGroup>, connection: db::Connection, user: ac_user::AcUser) -> Json<JsonValue> {
    let resp = RespMessage { message: ac_user::AcUser::join_group(user, info.code.clone(), &connection) };

    Json(json!(resp))
}

#[post("/create", data = "<info>")]
fn group_create(info: Json<CreateGroup>, connection: db::Connection, user: ac_user::AcUser) -> Json<JsonValue> {

    if user.group_id.is_some() {
        return Json(json!(RespMessage { message: "Error: Already in group".to_string()}))
    }

    let mut is_unique = false;
    let mut join_code: String = "".to_string();

    while ! is_unique {
        use std::iter;
        use rand::{Rng, thread_rng};
        use rand::distributions::Alphanumeric;

        let mut rng = thread_rng();
        join_code = iter::repeat(())
            .map(|()| rng.sample(Alphanumeric))
            .take(10)
            .collect();

        let resp = group::Group::get_group_by_code(join_code.clone(), &connection);
        is_unique = resp.is_err();
    }

    let new_group = group::NewGroup { name: info.name.clone(), join_code };

    group::Group::create(new_group, &connection);

    let resp = RespMessage { message: "success".to_string() };

    Json(json!(resp))
}

// endregion

fn main() {
    #[cfg(debug_assertions)]
    dotenv::dotenv().ok(); //Only loads .env file when compiled in debug mode.

    rocket::ignite()
        .manage(db::connect())
        .mount("/tracking", routes![get_tracking, catch_item, uncatch_item])
        .mount("/groups", routes![group_join, group_create])
        .launch();
}