use diesel;
use diesel::prelude::*;
use diesel::pg::PgConnection;

use crate::schema::groups;

use crate::api_responder::ApiResponder;
use rocket::http::Status;

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
    pub fn create(new_group: NewGroup, connection: &PgConnection) -> Result<Group, ApiResponder> {
        let result = diesel::insert_into(groups::table)
            .values(&new_group)
            .execute(connection);

        match result {
            Ok(v) => {
                match groups::table.order(groups::id.desc()).first(connection) {
                    Ok(v) => {
                        return Ok(v)
                    }
                    Err(err) => {
                        return Err(ApiResponder {error: Status::InternalServerError, message: err.to_string()})
                    }
                }
            }
            Err(err) => {
                return Err(ApiResponder {error: Status::InternalServerError, message: err.to_string()})
            }
        }
    }

    pub fn update(id: i32, group: Group, connection: &PgConnection) -> Result< (), ApiResponder> {
        match diesel::update(groups::table.find(id)).set(&group).execute(connection) {
            Ok(v) => {
                return Ok(())
            }
            Err(err) => {
                return Err(ApiResponder {error: Status::InternalServerError, message: err.to_string()})
            }
        }
    }

    pub fn delete(id: i32, connection: &PgConnection) -> Result< (), ApiResponder> {
        match diesel::delete(groups::table.find(id)).execute(connection) {
            Ok(v) => {
                return Ok(())
            }
            Err(err) => {
                return Err(ApiResponder {error: Status::InternalServerError, message: err.to_string()})
            }
        }
    }

    pub fn get_group_by_id(id: i32, connection: &PgConnection) -> Result<Group, ApiResponder> {
        let groups_res: Result<std::vec::Vec<_>, diesel::result::Error> = crate::schema::groups::dsl::groups
            .filter(groups::id.eq(id))
            .load(connection);

        match groups_res {
            Ok(v) => {
                let mut groups = v;

                if groups.len() == 1 {
                    let mut group = groups.drain(0..1);
                    return Ok(group.next().unwrap())
                }else{
                    return Err(ApiResponder {error: Status::NotFound, message: "Not Found".to_string()})
                }
            }
            Err(err) => {
                return Err(ApiResponder {error: Status::InternalServerError, message: err.to_string()})
            }
        }
    }

    pub fn get_group_by_code(code: String, connection: &PgConnection) -> Result<Group, ApiResponder> {

        let groups_res: Result<std::vec::Vec<_>, diesel::result::Error> = crate::schema::groups::dsl::groups
            .filter(groups::join_code.eq(code))
            .load(connection);

        match groups_res {
            Ok(v) => {
                let mut groups = v;

                if groups.len() == 1 {
                    let mut group = groups.drain(0..1);
                    return Ok(group.next().unwrap())
                }else{
                    return Err(ApiResponder {error: Status::NotFound, message: "Not Found".to_string()})
                }
            }
            Err(err) => {
                return Err(ApiResponder {error: Status::InternalServerError, message: err.to_string()})
            }
        }
    }
}