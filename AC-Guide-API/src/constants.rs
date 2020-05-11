pub enum CollectableTypeEnum {
    Art = 1,
    Bug = 2,
    Fish = 3,
    Fossil = 4
}

pub enum Roles {
    User = 1,
    Admin = 2,
    Owner = 3
}

pub static NO_GROUP_CODE: u16 = 419;
pub static NO_GROUP_REASON: &'static str = "User Is Not In a Group";