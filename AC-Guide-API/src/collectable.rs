use diesel;
use diesel::prelude::*;
use diesel::pg::PgConnection;

use crate::schema::collectables;
use crate::schema::collected_items;
use crate::constants::CollectableTypeEnum;


#[derive(Serialize, Deserialize, Queryable)]
//#[table_name = "collectables"]
#[serde(rename_all = "camelCase")]
pub struct Collectable {
    pub id: i32,
    pub display_name: String,
    pub img_location: String,
    pub type_id: i32,
    pub price: i32,
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
    pub fn get_caught(collect_type: CollectableTypeEnum, user_id: i32, connection: &PgConnection) -> Vec<Collectable> {
        let type_ = collect_type as i32;


        let data: Vec<i32> = crate::schema::collectables::dsl::collectables
            .inner_join(crate::schema::collected_items::dsl::collected_items.on(collected_items::user_id.eq(collectables::id)))
            .filter(collectables::id.eq(type_))
//            .select((collectables::id, collectables::display_name, collectables::img_location, collectables::type_id, collectables::price))
            .select((collectables::id))
            .load(connection).expect("Error Getting Collectable.");

        Vec::new()

    }

//    pub fn get_always_avail(collect_type: CollectableTypeEnum, user_id: i32) -> Vec<Collectable> {
//        let possible_types = [CollectableTypeEnum::Art as u8, CollectableTypeEnum::Fossil as u8];
//
//        assert!(possible_types.contains(&(collect_type as u8)));
//
//
//    }
}