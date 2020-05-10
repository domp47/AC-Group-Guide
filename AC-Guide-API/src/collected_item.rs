use diesel;
use diesel::prelude::*;
use diesel::pg::PgConnection;

use crate::schema::collected_items;

use crate::api_responder::ApiResponder;
use rocket::http::Status;

#[derive(Identifiable, Serialize, Deserialize, Associations, Queryable, Insertable)]
#[serde(rename_all = "camelCase")]
#[primary_key(user_id, collectable_id)]
pub struct CollectedItem {
    pub user_id: String,
    pub collectable_id: i32,
}

impl CollectedItem {
    pub fn create(c_i: CollectedItem, connection: &PgConnection) -> Result<(), ApiResponder> {
        match diesel::insert_into(collected_items::dsl::collected_items)
            .values(&c_i)
            .execute(connection) {
            Ok(v) => {
                return Ok(())
            }
            Err(err) => {
                return Err(ApiResponder {error: Status::InternalServerError, message: err.to_string()})
            }
        }

    }

    pub fn delete(u_id: String, c_id: i32, connection: &PgConnection) -> Result<(), ApiResponder> {
        match diesel::delete(collected_items::table.find((u_id, c_id))).execute(connection) {
            Ok(v) => {
                return Ok(())
            }
            Err(err) => {
                return Err(ApiResponder {error: Status::InternalServerError, message: err.to_string()})
            }
        }
    }

}