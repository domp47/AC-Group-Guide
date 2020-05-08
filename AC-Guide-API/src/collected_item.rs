use diesel;
use diesel::prelude::*;
use diesel::pg::PgConnection;

use crate::schema::collected_items;

#[derive(Identifiable, Serialize, Deserialize, Associations, Queryable, Insertable)]
#[serde(rename_all = "camelCase")]
#[primary_key(user_id, collectable_id)]
pub struct CollectedItem {
    pub user_id: String,
    pub collectable_id: i32,
}

impl CollectedItem {
    pub fn create(c_i: CollectedItem, connection: &PgConnection) -> () {
        diesel::insert_into(collected_items::dsl::collected_items)
            .values(&c_i)
            .execute(connection)
            .expect("Error creating new collected item");
    }

    pub fn delete(u_id: String, c_id: i32, connection: &PgConnection) -> bool {
        diesel::delete(collected_items::table.find((u_id, c_id))).execute(connection).is_ok()
    }

}