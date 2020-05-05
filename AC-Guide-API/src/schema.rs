table! {
    acRoles (id) {
        id -> Int4,
        label -> Varchar,
    }
}

table! {
    acUsers (id) {
        id -> Int4,
        googleId -> Varchar,
        displayName -> Varchar,
        groupId -> Nullable<Int4>,
        roleId -> Int4,
    }
}

table! {
    collectables (id) {
        id -> Int4,
        displayName -> Varchar,
        imgLocation -> Varchar,
        typeId -> Int4,
        price -> Int4,
        spawnLocation -> Nullable<Varchar>,
        northMask -> Nullable<Int4>,
        southMask -> Nullable<Int4>,
        northLabel -> Nullable<Varchar>,
        southLabel -> Nullable<Varchar>,
        timeMask -> Nullable<Int4>,
        timeLabel -> Nullable<Varchar>,
        shadowSize -> Nullable<Varchar>,
        original -> Nullable<Varchar>,
        artist -> Nullable<Varchar>,
        imgLocationAlt -> Nullable<Varchar>,
    }
}

table! {
    collectableTypes (id) {
        id -> Int4,
        #[sql_name = "type"]
        type_ -> Varchar,
    }
}

table! {
    collectedItems (userId, collectableId) {
        userId -> Int4,
        collectableId -> Int4,
    }
}

table! {
    groups (id) {
        id -> Int4,
        name -> Varchar,
        joinCode -> Varchar,
    }
}

joinable!(acUsers -> acRoles (roleId));
joinable!(acUsers -> groups (groupId));
joinable!(collectables -> collectableTypes (typeId));
joinable!(collectedItems -> acUsers (userId));
joinable!(collectedItems -> collectables (collectableId));

allow_tables_to_appear_in_same_query!(
    acRoles,
    acUsers,
    collectables,
    collectableTypes,
    collectedItems,
    groups,
);
