table! {
    acRoles (id) {
        id -> Int4,
        label -> Nullable<Varchar>,
    }
}

table! {
    acUsers (id) {
        id -> Int4,
        googleId -> Nullable<Varchar>,
        displayName -> Nullable<Varchar>,
        groupId -> Nullable<Int4>,
        roleId -> Nullable<Int4>,
    }
}

table! {
    collectables (id) {
        id -> Int4,
        displayName -> Nullable<Varchar>,
        imgLocation -> Nullable<Varchar>,
        typeId -> Nullable<Int4>,
        spawnLocation -> Nullable<Varchar>,
        northMask -> Nullable<Int4>,
        southMask -> Nullable<Int4>,
        northLabel -> Nullable<Varchar>,
        southLabel -> Nullable<Varchar>,
        timeMask -> Nullable<Int4>,
        timeLabel -> Nullable<Varchar>,
        shadowSize -> Nullable<Varchar>,
        orgiginal -> Nullable<Varchar>,
        artist -> Nullable<Varchar>,
        imgLocationAlt -> Nullable<Varchar>,
    }
}

table! {
    collectableTypes (id) {
        id -> Int4,
        #[sql_name = "type"]
        type_ -> Nullable<Varchar>,
    }
}

table! {
    collectedItems (id) {
        id -> Int4,
        userId -> Nullable<Int4>,
        collectableId -> Nullable<Int4>,
    }
}

table! {
    groups (id) {
        id -> Int4,
        name -> Nullable<Varchar>,
        joinCode -> Nullable<Varchar>,
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
