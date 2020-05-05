use diesel;
use diesel::prelude::*;
use disel::pg::PgConnection;

use schema::collectableTypes;

#[table_name = "collectableTypes"]
#[derive(Serialize, Deserialize, Queryable)]
#[serde(rename_all = "camelCase")]
pub struct CollectableType {
    id: i32,
    #[serde(rename = "type")]
    type_: String
}

impl CollectableType {
    pub fn read(connection: &PgConnection) -> Vec<CollectableType> {
        acRoles::table.order(acRoles::id.asc()).load::<AcRole>(connection).unwrap()
    }
}

