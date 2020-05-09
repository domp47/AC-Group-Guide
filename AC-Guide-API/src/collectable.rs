use diesel;
use diesel::prelude::*;
use diesel::pg::PgConnection;

use crate::schema::collectables;
use crate::schema::collected_items;
use crate::constants::CollectableTypeEnum;


diesel_infix_operator!(BitwiseAnd, " & ", diesel::sql_types::Integer);

use diesel::expression::AsExpression;

pub fn bitwise_and<T, U>(left: T, right: U) -> BitwiseAnd<T, U::Expression> where
    T: Expression,
    U: AsExpression<T::SqlType>,
{
    BitwiseAnd::new(left, right.as_expression())
}

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

    pub fn get_caught(collect_type: CollectableTypeEnum, user_id: String, connection: &PgConnection) -> Vec<Collectable> {
        let type_ = collect_type as i32;

        crate::schema::collectables::dsl::collectables
            .inner_join(crate::schema::collected_items::dsl::collected_items.on(collected_items::collectable_id.eq(collectables::id)))
            .filter(collectables::id.eq(type_).and(collected_items::user_id.eq(user_id)))
            .select((collectables::id, collectables::display_name, collectables::img_location,
                     collectables::type_id, collectables::price, collectables::spawn_location,
                     collectables::north_mask, collectables::south_mask, collectables::north_label,
                     collectables::south_label, collectables::time_mask, collectables::time_label,
                     collectables::shadow_size, collectables::original, collectables::artist, collectables::img_location_alt))
            .order(collectables::display_name.asc())
            .load(connection).expect("Error Getting Collectable.")
    }

    pub fn get_always_avail(collect_type: CollectableTypeEnum, user_id: String, connection: &PgConnection) -> Vec<Collectable> {
        let possible_types = [CollectableTypeEnum::Art as i32, CollectableTypeEnum::Fossil as i32];
        let type_ = collect_type as i32;

        assert!(possible_types.contains(&type_));

        crate::schema::collectables::dsl::collectables
            .left_join(crate::schema::collected_items::dsl::collected_items.on(collected_items::collectable_id.eq(collectables::id).and(collected_items::user_id.eq(user_id))))
            .filter(collected_items::collectable_id.is_null().and(collectables::type_id.eq(type_)))
            .select((collectables::id, collectables::display_name, collectables::img_location,
                     collectables::type_id, collectables::price, collectables::spawn_location,
                     collectables::north_mask, collectables::south_mask, collectables::north_label,
                     collectables::south_label, collectables::time_mask, collectables::time_label,
                     collectables::shadow_size, collectables::original, collectables::artist, collectables::img_location_alt))
            .order(collectables::display_name.asc())
            .load(connection).expect("Error Getting Collectable.")
    }

    pub fn get_timed_now(collect_type: CollectableTypeEnum, user_id: String, month_mask: i32, time_mask: i32, hemisphere: bool, connection: &PgConnection) -> Vec<Collectable> {
        let possible_types = [CollectableTypeEnum::Bug as i32, CollectableTypeEnum::Fish as i32];
        let type_ = collect_type as i32;

        assert!(possible_types.contains(&type_));

        if hemisphere {
            return crate::schema::collectables::dsl::collectables
                .left_join(crate::schema::collected_items::dsl::collected_items.on(collected_items::collectable_id.eq(collectables::id).and(collected_items::user_id.eq(user_id))))
                .filter(collected_items::collectable_id.is_null().and(collectables::type_id.eq(type_)).and(bitwise_and(collectables::north_mask, month_mask).ne(0)).and(bitwise_and(collectables::time_mask, time_mask).ne(0)))
                .select((collectables::id, collectables::display_name, collectables::img_location,
                         collectables::type_id, collectables::price, collectables::spawn_location,
                         collectables::north_mask, collectables::south_mask, collectables::north_label,
                         collectables::south_label, collectables::time_mask, collectables::time_label,
                         collectables::shadow_size, collectables::original, collectables::artist, collectables::img_location_alt))
                .order(collectables::display_name.asc())
                .load(connection).expect("Error Getting Collectable.");
        }
        crate::schema::collectables::dsl::collectables
            .left_join(crate::schema::collected_items::dsl::collected_items.on(collected_items::collectable_id.eq(collectables::id).and(collected_items::user_id.eq(user_id))))
            .filter(collected_items::collectable_id.is_null().and(collectables::type_id.eq(type_)).and(bitwise_and(collectables::south_mask, month_mask).ne(0)).and(bitwise_and(collectables::time_mask, time_mask).ne(0)))
            .select((collectables::id, collectables::display_name, collectables::img_location,
                     collectables::type_id, collectables::price, collectables::spawn_location,
                     collectables::north_mask, collectables::south_mask, collectables::north_label,
                     collectables::south_label, collectables::time_mask, collectables::time_label,
                     collectables::shadow_size, collectables::original, collectables::artist, collectables::img_location_alt))
            .order(collectables::display_name.asc())
            .load(connection).expect("Error Getting Collectable.")

    }

    pub fn get_timed_this_month(collect_type: CollectableTypeEnum, user_id: String, month_mask: i32, time_mask: i32, hemisphere: bool, connection: &PgConnection) -> Vec<Collectable> {
        let possible_types = [CollectableTypeEnum::Bug as i32, CollectableTypeEnum::Fish as i32];
        let type_ = collect_type as i32;

        assert!(possible_types.contains(&type_));

        if hemisphere {
            return crate::schema::collectables::dsl::collectables
                .left_join(crate::schema::collected_items::dsl::collected_items.on(collected_items::collectable_id.eq(collectables::id).and(collected_items::user_id.eq(user_id))))
                .filter(collected_items::collectable_id.is_null().and(collectables::type_id.eq(type_)).and(bitwise_and(collectables::north_mask, month_mask).ne(0)).and(bitwise_and(collectables::time_mask, time_mask).eq(0)))
                .select((collectables::id, collectables::display_name, collectables::img_location,
                         collectables::type_id, collectables::price, collectables::spawn_location,
                         collectables::north_mask, collectables::south_mask, collectables::north_label,
                         collectables::south_label, collectables::time_mask, collectables::time_label,
                         collectables::shadow_size, collectables::original, collectables::artist, collectables::img_location_alt))
                .order(collectables::display_name.asc())
                .load(connection).expect("Error Getting Collectable.");
        }
        crate::schema::collectables::dsl::collectables
            .left_join(crate::schema::collected_items::dsl::collected_items.on(collected_items::collectable_id.eq(collectables::id).and(collected_items::user_id.eq(user_id))))
            .filter(collected_items::collectable_id.is_null().and(collectables::type_id.eq(type_)).and(bitwise_and(collectables::south_mask, month_mask).ne(0)).and(bitwise_and(collectables::time_mask, time_mask).eq(0)))
            .select((collectables::id, collectables::display_name, collectables::img_location,
                     collectables::type_id, collectables::price, collectables::spawn_location,
                     collectables::north_mask, collectables::south_mask, collectables::north_label,
                     collectables::south_label, collectables::time_mask, collectables::time_label,
                     collectables::shadow_size, collectables::original, collectables::artist, collectables::img_location_alt))
            .order(collectables::display_name.asc())
            .load(connection).expect("Error Getting Collectable.")

    }

    pub fn get_timed_not_avail(collect_type: CollectableTypeEnum, user_id: String, month_mask: i32, hemisphere: bool, connection: &PgConnection) -> Vec<Collectable> {
        let possible_types = [CollectableTypeEnum::Bug as i32, CollectableTypeEnum::Fish as i32];
        let type_ = collect_type as i32;

        assert!(possible_types.contains(&type_));

        if hemisphere {
            return crate::schema::collectables::dsl::collectables
                .left_join(crate::schema::collected_items::dsl::collected_items.on(collected_items::collectable_id.eq(collectables::id).and(collected_items::user_id.eq(user_id))))
                .filter(collected_items::collectable_id.is_null().and(collectables::type_id.eq(type_)).and(bitwise_and(collectables::north_mask, month_mask).eq(0)))
                .select((collectables::id, collectables::display_name, collectables::img_location,
                         collectables::type_id, collectables::price, collectables::spawn_location,
                         collectables::north_mask, collectables::south_mask, collectables::north_label,
                         collectables::south_label, collectables::time_mask, collectables::time_label,
                         collectables::shadow_size, collectables::original, collectables::artist, collectables::img_location_alt))
                .order(collectables::display_name.asc())
                .load(connection).expect("Error Getting Collectable.");
        }
        crate::schema::collectables::dsl::collectables
            .left_join(crate::schema::collected_items::dsl::collected_items.on(collected_items::collectable_id.eq(collectables::id).and(collected_items::user_id.eq(user_id))))
            .filter(collected_items::collectable_id.is_null().and(collectables::type_id.eq(type_)).and(bitwise_and(collectables::south_mask, month_mask).eq(0)))
            .select((collectables::id, collectables::display_name, collectables::img_location,
                     collectables::type_id, collectables::price, collectables::spawn_location,
                     collectables::north_mask, collectables::south_mask, collectables::north_label,
                     collectables::south_label, collectables::time_mask, collectables::time_label,
                     collectables::shadow_size, collectables::original, collectables::artist, collectables::img_location_alt))
            .order(collectables::display_name.asc())
            .load(connection).expect("Error Getting Collectable.")

    }

    pub fn get_missing(collect_type: CollectableTypeEnum, user_id: String, connection: &PgConnection) -> Vec<Collectable> {
        let type_ = collect_type as i32;

        return crate::schema::collectables::dsl::collectables
            .left_join(crate::schema::collected_items::dsl::collected_items.on(collected_items::collectable_id.eq(collectables::id).and(collected_items::user_id.eq(user_id))))
            .filter(collected_items::collectable_id.is_null().and(collectables::type_id.eq(type_)))
            .select((collectables::id, collectables::display_name, collectables::img_location,
                     collectables::type_id, collectables::price, collectables::spawn_location,
                     collectables::north_mask, collectables::south_mask, collectables::north_label,
                     collectables::south_label, collectables::time_mask, collectables::time_label,
                     collectables::shadow_size, collectables::original, collectables::artist, collectables::img_location_alt))
            .order(collectables::display_name.asc())
            .load(connection).expect("Error Getting Collectable.");
    }
}