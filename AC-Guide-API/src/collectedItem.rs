use diesel;
use diesel::prelude::*;
use disel::pg::PgConnection;

use collectable::Collectable;
use acUser::AcUser;

use schema::collectedItems;

//#[table_name = "collectedItems"]
#[derive(Identifiable, Serialize, Deserialize, Associations, Queryable, Insertable)]
#[serde(rename_all = "camelCase")]
#[belongs_to(AcUser)]
#[belongs_to(Collectable)]
#[primary_key(userId, collectableId)]
pub struct CollectedItem {
    pub user_id: i32,
    pub collectable_id: i32,
}

impl CollectedItem {
//    pub fn create(c_i: CollectedItem, connection: &PgConnection) -> () {
//        diesel::insert_into(collectedItems::table)
//            .values(&c_i)
//            .execute(connection)
//            .expect("Error creating new collected item");
//    }
//
//    pub fn read(connection: &PgConnection) -> Vec<CollectedItem> {
//        collectedItems::table.order(acUsers::user_id.asc()).load::<CollectedItem>(connection).unwrap()
//    }
//
//    pub fn delete(u_id: i32, c_id: i32, connection: &PgConnection) -> bool {
//        diesel::delete(collectedItems::table.find((u_id, c_id))).execute(connection).is_ok()
//    }

}