use std::ops::Deref;
use rocket::http::Status;
use rocket::request::{self, FromRequest};
use rocket::{Request, State, Outcome};

use r2d2;
use r2d2_diesel::ConnectionManager;

use disel::pg::PgConnection;

pub type Pool = r2d2::Pool<ConnectionManager<PgConnection>>;
static DATABASE_URL: &'static str = env!("DATABASE_URL");

pub fn connect() -> Pool {
    let manager = ConnectionManager::<PgConnection>::new(DATABASE_URL);
    r2d2::Pool::builder().build(manager).expect("Failed to create db pool")
}

// Connection request guard type: a wrapper around an r2d2 pooled connection.
pub struct Connection(pub r2d2::PooledConnection<ConnectionManager<MysqlConnection>>);

/// Attempts to retrieve a single connection from the managed database pool. If
/// no pool is currently managed, fails with an `InternalServerError` status. If
/// no connections are available, fails with a `ServiceUnavailable` status.
impl<'a, 'r> FromRequest<'a, 'r> for Connection {
    type Error = ();

    fn from_request(request: &'a Request<'r>) -> request::Outcome<Connection, ()> {
        let pool = request.guard::<State<Pool>>()?;
        match pool.get() {
            Ok(conn) => Outcome::Success(Connection(conn)),
            Err(_) => Outcome::Failure((Status::ServiceUnavailable, ()))
        }
    }
}

impl Deref for Connection {
    type Target = PgConnection;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}