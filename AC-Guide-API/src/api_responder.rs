use std::io::Cursor;

use rocket::request::Request;
use rocket::response::{Response, Responder};
use rocket::http::ContentType;
use rocket::http::Status;


#[derive(Debug)]
pub struct ApiResponder {
    pub error: Status,
    pub message: String
}

#[derive(Deserialize, Serialize)]
#[serde(rename_all = "camelCase")]
struct RespBody {
    message: String
}

impl RespBody {
    pub fn new(api_error: &ApiResponder) -> RespBody{
        return RespBody { message: api_error.message.clone() }
    }
}

impl<'a> Responder<'a> for ApiResponder {
    fn respond_to(self, _request: &Request) -> Result<Response<'a>, Status> {

        let resp_body = serde_json::to_string(&RespBody::new(&self)).unwrap_or("".to_string());

        Response::build()
            .header(ContentType::JSON)
            .status(self.error)
            .sized_body(Cursor::new(resp_body))
            .ok()
    }
}