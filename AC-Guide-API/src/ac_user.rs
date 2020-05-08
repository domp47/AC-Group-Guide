use diesel;
use diesel::prelude::*;
use diesel::pg::PgConnection;

use crate::schema::ac_users;

#[derive(Serialize, Deserialize, Queryable, Insertable, Identifiable)]
#[serde(rename_all = "camelCase")]
#[primary_key(google_id)]
pub struct AcUser {
    pub google_id: String,
    pub display_name: String,
    pub group_id: Option<i32>,
    pub role_id: Option<i32>
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

    pub fn is_default(&self) -> bool {
        self.google_id == "" && self.display_name == "" && self.group_id == None && self.role_id == None
    }

    pub fn join_group(user_id: i32, code: String, connection: &PgConnection) -> () {

    }
}