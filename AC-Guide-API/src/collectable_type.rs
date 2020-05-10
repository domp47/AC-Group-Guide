use diesel;
use diesel::prelude::*;
use diesel::pg::PgConnection;

use schema::collectable_types;

use crate::api_responder::ApiResponder;
use rocket::http::Status;

#[table_name = "collectableTypes"]
#[derive(Serialize, Deserialize, Queryable)]
#[serde(rename_all = "camelCase")]
pub struct CollectableType {
    id: i32,
    #[serde(rename = "type")]
    type_: String
}

impl CollectableType {
}

