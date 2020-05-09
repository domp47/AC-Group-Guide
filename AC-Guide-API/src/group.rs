use diesel;
use diesel::prelude::*;
use diesel::pg::PgConnection;

use crate::schema::groups;

#[table_name = "groups"]
#[derive(Serialize, Deserialize, Queryable, AsChangeset)]
#[serde(rename_all = "camelCase")]
pub struct Group {
    pub id: i32,
    pub name: String,
    pub join_code: String
}

#[table_name = "groups"]
#[derive(Serialize, Deserialize, Insertable, Queryable)]
#[serde(rename_all = "camelCase")]
pub struct NewGroup {
    pub name: String,
    pub join_code: String
}


impl Group {
    //TODO return result with group
    pub fn create(new_group: NewGroup, connection: &PgConnection) -> Group {
        diesel::insert_into(groups::table)
            .values(&new_group)
            .execute(connection)
            .expect("Error creating new group");

        groups::table.order(groups::id.desc()).first(connection).unwrap()
    }

    pub fn update(id: i32, group: Group, connection: &PgConnection) -> bool {
        diesel::update(groups::table.find(id)).set(&group).execute(connection).is_ok()
    }

    pub fn delete(id: i32, connection: &PgConnection) -> bool {
        diesel::delete(groups::table.find(id)).execute(connection).is_ok()
    }

    pub fn get_group_by_id(id: i32, connection: &PgConnection) -> Result<Group, i32> {
        let groups_res: Result<std::vec::Vec<_>, diesel::result::Error> = crate::schema::groups::dsl::groups
            .filter(groups::id.eq(id))
            .load(connection);

        if groups_res.is_err() {
            return Err(-1)
        }

        let mut groups = groups_res.unwrap();

        if groups.len() == 1 {
            let mut group = groups.drain(0..1);
            return Ok(group.next().unwrap())
        }else{
            return Err(0)
        }
    }

    pub fn get_group_by_code(code: String, connection: &PgConnection) -> Result<Group, i32> {

        let groups_res: Result<std::vec::Vec<_>, diesel::result::Error> = crate::schema::groups::dsl::groups
            .filter(groups::join_code.eq(code))
            .load(connection);

        if groups_res.is_err() {
            return Err(-1)
        }

        let mut groups = groups_res.unwrap();

        if groups.len() == 1 {
            let mut group = groups.drain(0..1);
            return Ok(group.next().unwrap())
        }else{
            return Err(0)
        }
    }
}