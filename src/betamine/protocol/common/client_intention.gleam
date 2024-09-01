import betamine/protocol/error

pub type Intention {
  Status
  Login
  Transfer
}

pub fn from_int(int: Int) {
  case int {
    0 -> Ok(Status)
    1 -> Ok(Login)
    2 -> Ok(Transfer)
    _ -> Error(error.InvalidEnumValue(min: 0, max: 2, value: int))
  }
}
