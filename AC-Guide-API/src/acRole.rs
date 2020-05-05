use diesel;
use diesel::prelude::*;
use disel::pg::PgConnection;

use schema::acRoles;

#[table_name = "acRoles"]
#[derive(Serialize, Deserialize, Queryable)]
#[serde(rename_all = "camelCase")]
pub struct AcRole {
    id: i32,
    label: String
}

impl AcRole {
    pub fn read(connection: &PgConnection) -> Vec<AcRole> {
        acRoles::table.order(acRoles::id.asc()).load::<AcRole>(connection).unwrap()
    }
}

