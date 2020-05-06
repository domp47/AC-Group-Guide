table! {
    ac_roles (id) {
        id -> Int4,
        label -> Varchar,
    }
}

table! {
    ac_users (id) {
        id -> Int4,
        google_id -> Varchar,
        display_name -> Varchar,
        group_id -> Nullable<Int4>,
        role_id -> Int4,
    }
}

table! {
    collectables (id) {
        id -> Int4,
        display_name -> Varchar,
        img_location -> Varchar,
        type_id -> Int4,
        price -> Int4,
        spawn_location -> Nullable<Varchar>,
        north_mask -> Nullable<Int4>,
        south_mask -> Nullable<Int4>,
        north_label -> Nullable<Varchar>,
        south_label -> Nullable<Varchar>,
        time_mask -> Nullable<Int4>,
        time_label -> Nullable<Varchar>,
        shadow_size -> Nullable<Varchar>,
        original -> Nullable<Varchar>,
        artist -> Nullable<Varchar>,
        img_location_alt -> Nullable<Varchar>,
    }
}

table! {
    collectable_types (id) {
        id -> Int4,
        #[sql_name = "type"]
        type_ -> Varchar,
    }
}

table! {
    collected_items (user_id, collectable_id) {
        user_id -> Int4,
        collectable_id -> Int4,
    }
}

table! {
    groups (id) {
        id -> Int4,
        name -> Varchar,
        join_code -> Varchar,
    }
}

joinable!(ac_users -> ac_roles (role_id));
joinable!(ac_users -> groups (group_id));
joinable!(collectables -> collectable_types (type_id));
joinable!(collected_items -> ac_users (user_id));
joinable!(collected_items -> collectables (collectable_id));

allow_tables_to_appear_in_same_query!(
    ac_roles,
    ac_users,
    collectables,
    collectable_types,
    collected_items,
    groups,
);
