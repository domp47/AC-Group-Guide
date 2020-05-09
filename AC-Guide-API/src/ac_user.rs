use diesel;
use diesel::prelude::*;
use diesel::pg::PgConnection;

use crate::schema::ac_users;
use crate::group::Group;
use crate::constants::Roles;

#[derive(Serialize, Deserialize, Queryable, Insertable, Identifiable, AsChangeset)]
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
    pub fn create(new_user: AcUser, connection: &PgConnection) -> AcUser {
        diesel::insert_into(ac_users::table)
            .values(&new_user)
            .execute(connection)
            .expect("Error creating new user");

        AcUser::get_user(new_user.google_id, connection)
    }

    pub fn get_user(google_id: String, connection: &PgConnection) -> AcUser {

        let mut users: Vec<AcUser> = crate::schema::ac_users::dsl::ac_users
            .filter(ac_users::google_id.eq(google_id))
            .load(connection).expect("Error Getting User.");

        if users.len() == 1 {
            let mut user = users.drain(0..1);
            return user.next().unwrap()
        }else{
            return AcUser { google_id: "".to_string(), display_name: "".to_string(), group_id: None, role_id: None}
        }
    }

    pub fn get_admin_users_by_group(group_id: i32, connection: &PgConnection) -> Vec<AcUser> {
        let users: Vec<AcUser> = crate::schema::ac_users::dsl::ac_users
            .filter(ac_users::group_id.eq(group_id).and(ac_users::role_id.ge(Roles::Admin as i32)))
            .load(connection).expect("Error Getting Users.");

        return users
    }

    pub fn get_regular_users_by_group(group_id: i32, connection: &PgConnection) -> Vec<AcUser> {
        let users: Vec<AcUser> = crate::schema::ac_users::dsl::ac_users
            .filter(ac_users::group_id.eq(group_id).and(ac_users::role_id.eq(Roles::User as i32)))
            .load(connection).expect("Error Getting Users.");

        return users
    }

    pub fn get_users_by_group(group_id: i32, connection: &PgConnection) -> Vec<AcUser> {
        let users: Vec<AcUser> = crate::schema::ac_users::dsl::ac_users
            .filter(ac_users::group_id.eq(group_id))
            .load(connection).expect("Error Getting Users.");

        return users
    }

    pub fn is_default(&self) -> bool {
        self.google_id == "" && self.display_name == "" && self.group_id == None && self.role_id == None
    }

    pub fn leave_group(mut user: AcUser, connection: &PgConnection) -> String {
        user.group_id = None;
        user.role_id = None;

        let result = diesel::update(ac_users::table.find(user.google_id.clone())).set(&user).execute(connection).is_ok();

        if result {
            return "success".to_string()
        }

        return "Error Leaving Group".to_string()
    }

    pub fn change_role(mut user: AcUser, role: Roles, connection: &PgConnection) -> String {
        user.role_id = Some(role as i32);


        let result = diesel::update(ac_users::table.find(user.google_id.clone())).set(&user).execute(connection).is_ok();

        if result {
            return "success".to_string()
        }

        return "Error Joining Group".to_string()
    }

    pub fn join_group(mut user: AcUser, code: String, connection: &PgConnection) -> String {
        let group_res = Group::get_group_by_code(code.clone(), connection);

        match group_res {
            Ok(group) => {
                user.group_id = Some(group.id);
                user.role_id = Some(Roles::User as i32);

                let result = diesel::update(ac_users::table.find(user.google_id.clone())).set(&user).execute(connection).is_ok();

                if result {
                    return "success".to_string()
                }

                return "Error Joining Group".to_string()
            }
            Err(err) => {
                if err == 0 {
                    return "No Group With Join Code Found".to_string()
                }else {
                    return "Error Getting Groups".to_string()
                }
            }
        }
    }
}