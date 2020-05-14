use diesel;
use diesel::prelude::*;
use diesel::pg::PgConnection;

use schema::ac_roles;

#[derive(Serialize, Deserialize, Queryable)]
#[serde(rename_all = "camelCase")]
pub struct AcRole {
    id: i32,
    label: String
}

impl AcRole {
}

