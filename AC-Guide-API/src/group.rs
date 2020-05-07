use diesel;
use diesel::prelude::*;
use disel::pg::PgConnection;

use schema::groups;

#[table_name = "groups"]
#[derive(Serialize, Deserialize, Queryable)]
#[serde(rename_all = "camelCase")]
pub struct Group {
    id: i32,
    name: String,
    join_code: String
}

#[table_name = "groups"]
#[derive(Serialize, Deserialize, Insertable)]
#[serde(rename_all = "camelCase")]
pub struct NewGroup {
    name: String
}


impl Group {
    pub fn create(new_group: NewGroup, connection: &PgConnection) -> Group {
        diesel::insert_into(groups::table)
            .values(&new_group)
            .execute(connection)
            .expect("Error creating new group");

        groups::table.order(Group::id.desc()).first(connection).unwrap()
    }

    pub fn read(connection: &PgConnection) -> Vec<Group> {
        groups::table.order(groups::id.asc()).load::<Group>(connection).unwrap()
    }

    pub fn update(id: i32, group: Group, connection: &PgConnection) -> bool {
        diesel::update(groups::table.find(id)).set(&group).execute(connection).is_ok()
    }

    pub fn delete(id: i32, connection: &PgConnection) -> bool {
        diesel::delete(groups::table.find(id)).execute(connection).is_ok()
    }
}