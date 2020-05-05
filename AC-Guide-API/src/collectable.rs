use diesel;
use diesel::prelude::*;
use disel::pg::PgConnection;

use schema::collectables;

#[table_name = "collectables"]
#[derive(Serialize, Deserialize, Queryable)]
#[serde(rename_all = "camelCase")]
pub struct Collectable {
    id: i32,
    pub display_name: String,
    pub img_location: String,
    pub type_id: i32,
    price: i32,
    pub spawn_location: Option<String>,
    pub north_mask: Option<i32>,
    pub south_mask: Option<i32>,
    pub north_label: Option<String>,
    pub south_label: Option<String>,
    pub time_mask: Option<i32>,
    pub time_label: Option<String>,
    pub shadow_size: Option<String>,
    pub original: Option<String>,
    pub artist: Option<String>,
    pub img_location_alt: Option<String>
}

impl Collectable {
    pub fn read(connection: &PgConnection) -> Vec<Collectable> {
        collectables::table.order(collectables::id.asc()).load::<Collectable>(connection).unwrap()
    }
}