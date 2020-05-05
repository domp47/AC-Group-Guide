use diesel;
use diesel::prelude::*;
use disel::pg::PgConnection;

use group::Group;
use acRole::AcRole;

use schema::acUsers;

#[table_name = "acUsers"]
#[derive(Serialize, Deserialize, Associations, Queryable)]
#[serde(rename_all = "camelCase")]
#[belongs_to(Group)]
#[belongs_to(AcRole)]
pub struct AcUser {
    id: i32,
    google_id: String,
    display_name: String,
    group_id: Option<i32>,
    role_id: i32
}

#[table_name = "acUsers"]
#[derive(Serialize, Deserialize, Associations, Insertable)]
#[serde(rename_all = "camelCase")]
#[belongs_to(Group)]
#[belongs_to(AcRole)]
pub struct NewAcUser {
    google_id: String,
    display_name: String,
    group_id: Option<i32>,
    role_id: i32
}

impl AcUser {
    pub fn create(new_user: NewAcUser, connection: &PgConnection) -> AcUser {
        diesel::insert_into(acUsers::table)
            .values(&new_user)
            .execute(connection)
            .expect("Error creating new user");

        acUsers::table.order(AcUser::id.desc()).first(connection).unwrap()
    }

    pub fn read(connection: &PgConnection) -> Vec<AcUser> {
        acUsers::table.order(acUsers::id.asc()).load::<AcUser>(connection).unwrap()
    }

    pub fn update(id: i32, user: AcUser, connection: &PgConnection) -> bool {
        diesel::update(acUsers::table.find(id)).set(&user).execute(connection).is_ok()
    }

    pub fn delete(id: i32, connection: &PgConnection) -> bool {
        diesel::delete(acUsers::table.find(id)).execute(connection).is_ok()
    }
}