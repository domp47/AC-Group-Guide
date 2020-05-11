#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use] extern crate rocket;
#[macro_use] extern crate serde_derive;
#[macro_use] extern crate diesel;

extern crate rocket_contrib;
extern crate r2d2;
extern crate r2d2_diesel;
extern crate rocket_cors;

mod auth;
mod db;
mod schema;
mod api_responder;

mod ac_user;
mod collectable;
mod collected_item;
mod group;

mod constants;

use rocket_contrib::json::Json;
use rocket_contrib::json::JsonValue;
use rocket_contrib::json;
use rocket::http::Status;
use api_responder::ApiResponder;
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

#[derive(Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
struct AdminResponse {
    users: Vec<ac_user::AcUser>,
    admins: Vec<ac_user::AcUser>,

    join_code: String
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
fn get_tracking(info: Json<GetTracking>, connection: db::Connection, user: ac_user::AcUser) -> Result<Json<JsonValue>, ApiResponder>  {
    let month = info.month;
    let hour = info.hour;

    if month < 1 || month > 12 {
        return Err(ApiResponder { error: Status::BadRequest, message: "Error: Invalid Month. Must be between 1-12".to_string() })
    }
    if hour < 0 || hour > 23 {
        return Err(ApiResponder { error: Status::BadRequest, message: "Error: Invalid Hour. Must be between 0-23".to_string() })
    }

    let m_mask = 1 << (12 - month);
    let h_mask = 1 << (23 - hour);

    let resp = TrackingResponse {
        missing_art: get_art_list(collectable::Collectable::get_always_avail(constants::CollectableTypeEnum::Art, user.google_id.clone(), &connection)?),
        acquired_art: get_art_list(collectable::Collectable::get_caught(constants::CollectableTypeEnum::Art, user.google_id.clone(), &connection)?),

        avail_now_bugs: get_bug_list(collectable::Collectable::get_timed_now(constants::CollectableTypeEnum::Bug, user.google_id.clone(), m_mask, h_mask, info.hemisphere, &connection )?),
        avail_later_bugs: get_bug_list(collectable::Collectable::get_timed_this_month(constants::CollectableTypeEnum::Bug, user.google_id.clone(), m_mask, h_mask, info.hemisphere, &connection )?),
        not_avail_bugs: get_bug_list(collectable::Collectable::get_timed_not_avail(constants::CollectableTypeEnum::Bug, user.google_id.clone(), m_mask, info.hemisphere, &connection )?),
        caught_bugs: get_bug_list(collectable::Collectable::get_caught(constants::CollectableTypeEnum::Bug, user.google_id.clone(), &connection)?),

        avail_now_fish: get_fish_list(collectable::Collectable::get_timed_now(constants::CollectableTypeEnum::Fish, user.google_id.clone(), m_mask, h_mask, info.hemisphere, &connection )?),
        avail_later_fish: get_fish_list(collectable::Collectable::get_timed_this_month(constants::CollectableTypeEnum::Fish, user.google_id.clone(), m_mask, h_mask, info.hemisphere, &connection )?),
        not_avail_fish: get_fish_list(collectable::Collectable::get_timed_not_avail(constants::CollectableTypeEnum::Fish, user.google_id.clone(), m_mask, info.hemisphere, &connection )?),
        caught_fish: get_fish_list(collectable::Collectable::get_caught(constants::CollectableTypeEnum::Fish, user.google_id.clone(), &connection)?),

        missing_fossils: get_fossil_list(collectable::Collectable::get_always_avail(constants::CollectableTypeEnum::Fossil, user.google_id.clone(), &connection)?),
        acquired_fossils: get_fossil_list(collectable::Collectable::get_caught(constants::CollectableTypeEnum::Fossil, user.google_id.clone(), &connection)?)
    };

    Ok(Json(json!(resp)))
}

#[put("/<id>")]
fn catch_item(id: i32, connection: db::Connection, user: ac_user::AcUser) -> Result<Json<JsonValue>, ApiResponder> {
    let item = collected_item::CollectedItem { user_id: user.google_id, collectable_id: id };
    collected_item::CollectedItem::create(item, &connection)?;

    Ok(Json(json!({})))
}

#[delete("/<id>")]
fn uncatch_item(id: i32, connection: db::Connection, user: ac_user::AcUser) -> Result<Json<JsonValue>, ApiResponder> {
    collected_item::CollectedItem::delete(user.google_id, id, &connection)?;

    Ok(Json(json!({})))
}

// endregion

// region Group

fn generate_code(connection: &db::Connection) -> String {
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

        let resp = group::Group::get_group_by_code(join_code.clone(), connection);
        is_unique = resp.is_err();
    }

    join_code
}

#[post("/join", data = "<info>")]
fn group_join(info: Json<JoinGroup>, connection: db::Connection, user: ac_user::AcUser) -> Result<Json<JsonValue>, ApiResponder> {
    ac_user::AcUser::join_group(user, info.code.clone(), &connection)?;

    Ok(Json(json!({})))
}

#[delete("/")]
fn group_leave(connection: db::Connection, user: ac_user::AcUser) -> Result<Json<JsonValue>, ApiResponder> {
    if user.role_id.is_some() && user.role_id.unwrap() == constants::Roles::Owner as i32{
        return Err(ApiResponder {error: Status::Conflict, message: "Owner cannot leave group. Either transfer ownership or delete the group.".to_string()})
    }

    ac_user::AcUser::leave_group(user, &connection)?;

    Ok(Json(json!({})))
}

#[post("/create", data = "<info>")]
fn group_create(info: Json<CreateGroup>, connection: db::Connection, user: ac_user::AcUser) -> Result<Json<JsonValue>, ApiResponder> {

    if user.group_id.is_some() {
        return Err(ApiResponder {error: Status::Conflict, message: "User is already in a group.".to_string()})
    }

    let join_code = generate_code(&connection);

    let new_group = group::NewGroup { name: info.name.clone(), join_code };
    let created_group = group::Group::create(new_group, &connection)?;

    let uid = user.google_id.clone();
    ac_user::AcUser::join_group(user, created_group.join_code.clone(), &connection)?;

    let joined_user = ac_user::AcUser::get_user(uid, &connection)?;
    ac_user::AcUser::change_role(joined_user, constants::Roles::Owner, &connection)?;

    Ok(Json(json!(created_group)))
}

#[get("/")]
fn group_get(connection: db::Connection, user: ac_user::AcUser) -> Result<Json<JsonValue>, ApiResponder> {
    if user.group_id.is_none(){
        return Err(ApiResponder {error: rocket::http::Status::new(constants::NO_GROUP_CODE, constants::NO_GROUP_REASON), message: "User is not in a group".to_string()})
    }

    let group = group::Group::get_group_by_id(user.group_id.unwrap(), &connection)?;

    Ok(Json(json!(group)))
}

// endregion

// region User

#[get("/")]
fn get_user(_connection: db::Connection, user: ac_user::AcUser) -> Result<Json<JsonValue>, ApiResponder> {
    Ok(Json(json!(user)))
}

// endregion

// region Admin

#[post("/", data = "<other>")]
fn add_admin(other: Json<ac_user::AcUser>, connection: db::Connection, user: ac_user::AcUser) -> Result<Json<JsonValue>, ApiResponder> {
    let other_user = ac_user::AcUser::get_user(other.google_id.clone(), &connection)?;

    if user.group_id.is_none() || other_user.group_id.is_none() || user.group_id.unwrap() != other_user.group_id.unwrap() {
        return Err(ApiResponder {error: Status::BadRequest, message: "Cannot make admin because either the user is not in a group or correct group.".to_string()})
    }

    if user.role_id.is_none() || user.role_id.unwrap() < constants::Roles::Admin as i32 {
        return Err(ApiResponder {error: Status::Forbidden, message: "Insufficient access.".to_string()})
    }

    ac_user::AcUser::change_role(other_user, constants::Roles::Admin, &connection)?;
    Ok(Json(json!({})))
}

#[delete("/", data = "<other>")]
fn remove_member(other: Json<ac_user::AcUser>, connection: db::Connection, user: ac_user::AcUser) -> Result<Json<JsonValue>, ApiResponder> {
    let other_user = ac_user::AcUser::get_user(other.google_id.clone(), &connection)?;

    if user.group_id.is_none() || other_user.group_id.is_none() || user.group_id.unwrap() != other_user.group_id.unwrap() {
        return Err(ApiResponder {error: Status::BadRequest, message: "Cannot remove user because either the user is not in a group or correct group.".to_string()})
    }

    if user.role_id.is_none() || user.role_id.unwrap() < constants::Roles::Admin as i32 {
        return Err(ApiResponder {error: Status::Forbidden, message: "Insufficient access.".to_string()})
    }

    if user.role_id.unwrap() == constants::Roles::Admin as i32 && (other_user.role_id.is_some() && other_user.role_id.unwrap() == constants::Roles::Admin as i32) {
        return Err(ApiResponder {error: Status::Forbidden, message: "Only an Owner can Remove an Admin.".to_string()})
    }

    ac_user::AcUser::leave_group(other_user, &connection)?;
    Ok(Json(json!({})))
}

#[delete("/admin", data = "<other>")]
fn remove_admin(other: Json<ac_user::AcUser>, connection: db::Connection, user: ac_user::AcUser) -> Result<Json<JsonValue>, ApiResponder> {
    let other_user = ac_user::AcUser::get_user(other.google_id.clone(), &connection)?;

    if user.group_id.is_none() || other_user.group_id.is_none() || user.group_id.unwrap() != other_user.group_id.unwrap() {
        return Err(ApiResponder {error: Status::BadRequest, message: "Cannot remove admin because either the user is not in a group or correct group.".to_string()})
    }

    if user.role_id.is_none() || user.role_id.unwrap() < constants::Roles::Owner as i32 {
        return Err(ApiResponder {error: Status::Forbidden, message: "Insufficient access.".to_string()})
    }

    ac_user::AcUser::change_role(other_user, constants::Roles::User, &connection)?;
    Ok(Json(json!({})))
}

#[patch("/code")]
fn regenerate_code(connection: db::Connection, user: ac_user::AcUser) -> Result<Json<JsonValue>, ApiResponder> {

    if user.group_id.is_none(){
        return Err(ApiResponder {error: Status::BadRequest, message: "Cannot regenerate code because user is not in a group.".to_string()})
    }

    if user.role_id.is_none() || user.role_id.unwrap() < constants::Roles::Admin as i32 {
        return Err(ApiResponder {error: Status::Forbidden, message: "Insufficient access.".to_string()})
    }

    let mut group = group::Group::get_group_by_id(user.group_id.unwrap(), &connection)?;

    group.join_code = generate_code(&connection);

    group::Group::update(group.id, group, &connection)?;

    Ok(Json(json!({})))
}

#[delete("/group")]
fn delete_group(connection: db::Connection, user: ac_user::AcUser) -> Result<Json<JsonValue>, ApiResponder> {
    if user.group_id.is_none(){
        return Err(ApiResponder {error: Status::BadRequest, message: "Cannot delete group because user is not in a group.".to_string()})
    }

    if user.role_id.is_none() || user.role_id.unwrap() < constants::Roles::Owner as i32 {
        return Err(ApiResponder {error: Status::Forbidden, message: "Insufficient access.".to_string()})
    }

    let group_id_to_delete = user.group_id.unwrap();
    let all_users = ac_user::AcUser::get_users_by_group(group_id_to_delete, &connection)?;

    for user_to_modify in all_users.iter().cloned() {
        ac_user::AcUser::leave_group(user_to_modify, &connection)?;
    }

    group::Group::delete(group_id_to_delete, &connection)?;

    Ok(Json(json!({})))
}

#[get("/")]
fn get_admin_data(connection: db::Connection, user: ac_user::AcUser) -> Result<Json<JsonValue>, ApiResponder> {
    if user.group_id.is_none(){
        return Err(ApiResponder {error: Status::BadRequest, message: "Cannot get group because user is not in a group.".to_string()})
    }

    let group = group::Group::get_group_by_id(user.group_id.unwrap(), &connection)?;

    let response = AdminResponse {
        users: ac_user::AcUser::get_regular_users_by_group(user.group_id.unwrap(), &connection)?,
        admins: ac_user::AcUser::get_admin_users_by_group(user.group_id.unwrap(), &connection)?,

        join_code: group.join_code
    };

    Ok(Json(json!(response)))
}

#[post("/transfer", data = "<other>")]
fn ownership_transfer(other: Json<ac_user::AcUser>, connection: db::Connection, user: ac_user::AcUser) -> Result<Json<JsonValue>, ApiResponder> {
    let other_user = ac_user::AcUser::get_user(other.google_id.clone(), &connection)?;

    if user.group_id.is_none(){
        return Err(ApiResponder {error: Status::BadRequest, message: "Cannot transfer group because user is not in a group.".to_string()})
    }

    if user.role_id.is_none() || user.role_id.unwrap() < constants::Roles::Owner as i32 {
        return Err(ApiResponder {error: Status::Forbidden, message: "Insufficient access.".to_string()})
    }

    if user.group_id.is_none() || other_user.group_id.is_none() || user.group_id.unwrap() != other_user.group_id.unwrap() {
        return Err(ApiResponder {error: Status::BadRequest, message: "Cannot transfer group because either the user is not in a group or correct group.".to_string()})
    }

    ac_user::AcUser::change_role(other_user, constants::Roles::Owner, &connection)?;
    ac_user::AcUser::change_role(user, constants::Roles::Admin, &connection)?;

    Ok(Json(json!({})))
}

// endregion

// region Home

#[get("/")]
fn get_home(connection: db::Connection, user: ac_user::AcUser) -> Result<Json<JsonValue>, ApiResponder> {
    if user.group_id.is_none(){
        return Err(ApiResponder {error: rocket::http::Status::new(constants::NO_GROUP_CODE, constants::NO_GROUP_REASON), message: "User is not in a group".to_string()})
    }

    let all_users = ac_user::AcUser::get_users_by_group(user.group_id.unwrap(), &connection)?;

    let mut resp: Vec<HomeResponse> = Vec::new();

    for user_to_get in all_users.iter().cloned() {
        if user_to_get.google_id.clone() == user.google_id.clone() {
            continue;
        }

        let home_resp = HomeResponse {
            display_name: user_to_get.display_name.clone(),

            missing_art: get_art_list(collectable::Collectable::get_missing(constants::CollectableTypeEnum::Art, user_to_get.google_id.clone(), &connection)?),
            missing_bugs: get_bug_list(collectable::Collectable::get_missing(constants::CollectableTypeEnum::Bug, user_to_get.google_id.clone(), &connection)?),
            missing_fish: get_fish_list(collectable::Collectable::get_missing(constants::CollectableTypeEnum::Fish, user_to_get.google_id.clone(), &connection)?),
            missing_fossils: get_fossil_list(collectable::Collectable::get_missing(constants::CollectableTypeEnum::Fossil, user_to_get.google_id.clone(), &connection)?)
        };

        resp.push(home_resp);
    }

    Ok(Json(json!(resp)))
}

// endregion

fn main() {
    #[cfg(debug_assertions)]
    dotenv::dotenv().ok(); //Only loads .env file when compiled in debug mode.


    let allowed_hosts_res = std::env::var("ALLOWED_HOSTS");

    if allowed_hosts_res.is_err() {
        println!("ENV Variable 'ALLOWED_HOSTS' not found.");
        return
    }

    let allowed_hosts: Vec<String> = allowed_hosts_res.unwrap().split(",").map(|s| s.to_string()).collect();

    let allowed_origins = rocket_cors::AllowedOrigins::some_exact(&allowed_hosts);

    let cors_res: Result<rocket_cors::Cors, rocket_cors::Error> = rocket_cors::CorsOptions {
        allowed_origins,
        allowed_methods: vec![rocket::http::Method::Get, rocket::http::Method::Put, rocket::http::Method::Post, rocket::http::Method::Delete]
            .into_iter()
            .map(From::from)
            .collect(),
        allowed_headers: rocket_cors::AllowedHeaders::some(&["Authorization", "Accept", "Access-Control-Allow-Origin", "Content-Type", "Referer", "User-Agent"]),
        allow_credentials: true,
        ..Default::default()
    }.to_cors();

    if cors_res.is_err() {
        println!("Failed to create CORS Fairing.");
        return
    }

    let cors = cors_res.unwrap();


    let mut catchers = Vec::new();

    catchers.push(rocket::Catcher::new(404, api_responder::handle_404));
    catchers.push(rocket::Catcher::new(403, api_responder::handle_403));
    catchers.push(rocket::Catcher::new(401, api_responder::handle_401));
    catchers.push(rocket::Catcher::new(500, api_responder::handle_500));


    rocket::ignite()
        .register(catchers)
        .manage(db::connect())
        .mount("/tracking", routes![get_tracking, catch_item, uncatch_item])
        .mount("/groups", routes![group_join, group_create, group_leave, group_get])
        .mount("/user", routes![get_user])
        .mount("/admin", routes![add_admin, remove_member, remove_admin, regenerate_code, delete_group, get_admin_data, ownership_transfer])
        .mount("/home", routes![get_home])
        .attach(cors)
        .launch();
}