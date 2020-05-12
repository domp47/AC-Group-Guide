use diesel;
use diesel::prelude::*;
use diesel::pg::PgConnection;

use crate::schema::ac_users;
use crate::group::Group;
use crate::constants::Roles;
use crate::api_responder::ApiResponder;

use rocket::http::Status;

#[derive(Serialize, Deserialize, Queryable, Insertable, Identifiable, AsChangeset)]
#[changeset_options(treat_none_as_null = "true")]
#[serde(rename_all = "camelCase")]
#[primary_key(google_id)]
pub struct AcUser {
    pub google_id: String,
    pub display_name: String,
    pub group_id: Option<i32>,
    pub role_id: Option<i32>
}

impl Clone for AcUser {
    fn clone(&self) -> Self {
        AcUser {
            google_id: self.google_id.clone(),
            display_name: self.display_name.clone(),
            group_id: self.group_id.clone(),
            role_id: self.role_id.clone()
        }
    }
}

impl AcUser {
    pub fn create(new_user: AcUser, connection: &PgConnection) -> Result<AcUser, ApiResponder> {
        match diesel::insert_into(ac_users::table)
            .values(&new_user)
            .execute(connection) {
            Ok(_v) => {
                return AcUser::get_user(new_user.google_id, connection)
            }
            Err(err) => {
                return Err(ApiResponder {error: Status::InternalServerError, message: err.to_string()})
            }
        }

    }

    pub fn get_user(google_id: String, connection: &PgConnection) -> Result<AcUser, ApiResponder> {

        let users_res= crate::schema::ac_users::dsl::ac_users
            .filter(ac_users::google_id.eq(google_id))
            .load(connection);

        match users_res {
            Ok(u) => {
                let mut users = u;

                if users.len() == 1 {
                    let mut user = users.drain(0..1);
                    return Ok(user.next().unwrap())
                }else{
                    return Err(ApiResponder {error: Status::NotFound, message: "Not Found".to_string()})
                }
           }
            Err(err) => {
                return Err(ApiResponder {error: Status::InternalServerError, message: err.to_string()})
            }
        }
    }

    pub fn get_users_by_group(group_id: i32, connection: &PgConnection) -> Result<Vec<AcUser>, ApiResponder> {
        let users = crate::schema::ac_users::dsl::ac_users
            .filter(ac_users::group_id.eq(group_id))
            .load(connection);

        match users {
            Ok(u) => {
                return Ok(u)
            }
            Err(err) => {
                return Err(ApiResponder {error: Status::InternalServerError, message: err.to_string()})
            }
        }
    }

    pub fn leave_group(mut user: AcUser, connection: &PgConnection) -> Result<(), ApiResponder> {
        user.group_id = None;
        user.role_id = None;

        let result = diesel::update(ac_users::table.find(user.google_id.clone())).set(&user).execute(connection);

        match result {
            Ok(_v) => {
                return Ok(())
            }
            Err(err) => {
                return Err(ApiResponder {error: Status::InternalServerError, message: err.to_string()})
            }
        }
    }

    pub fn change_role(mut user: AcUser, role: Roles, connection: &PgConnection) -> Result<(), ApiResponder> {
        user.role_id = Some(role as i32);

        let result = diesel::update(ac_users::table.find(user.google_id.clone())).set(&user).execute(connection);

        match result {
            Ok(_v) => {
                return Ok(())
            }
            Err(err) => {
                return Err(ApiResponder {error: Status::InternalServerError, message: err.to_string()})
            }
        }
    }

    pub fn join_group(mut user: AcUser, code: String, connection: &PgConnection) -> Result<(), ApiResponder> {
        let group = Group::get_group_by_code(code.clone(), connection)?;

        user.group_id = Some(group.id);
        user.role_id = Some(Roles::User as i32);

        let result = diesel::update(ac_users::table.find(user.google_id.clone())).set(&user).execute(connection);

        match result {
            Ok(_v) => {
                return Ok(())
            }
            Err(err) => {
                return Err(ApiResponder {error: Status::InternalServerError, message: err.to_string()})
            }
        }
    }
}