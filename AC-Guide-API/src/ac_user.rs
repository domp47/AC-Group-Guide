use diesel;
use diesel::prelude::*;
use disel::pg::PgConnection;

use group::Group;
use acRole::AcRole;

use crate::schema::ac_users;

#[derive(Serialize, Deserialize, Queryable)]
#[serde(rename_all = "camelCase")]
pub struct AcUser {
    id: i32,
    google_id: String,
    display_name: String,
    group_id: Option<i32>,
    role_id: Option<i32>
}

#[table_name = "acUsers"]
#[derive(Serialize, Deserialize, Insertable)]
#[serde(rename_all = "camelCase")]
pub struct NewAcUser {
    google_id: String,
    display_name: String,
    group_id: Option<i32>,
    role_id: Option<i32>
}

impl AcUser {
    pub fn create(new_user: NewAcUser, connection: &PgConnection) -> AcUser {
        diesel::insert_into(acUsers::table)
            .values(&new_user)
            .execute(connection)
            .expect("Error creating new user");

        acUsers::table.order(AcUser::id.desc()).first(connection).unwrap()
    }

    pub fn join_group(user_id: i32, code: String, connection: &PgConnection) -> () {

    }
}