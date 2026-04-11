import betamine/client/protocol/error

/// Denotes the intention of the client's connection
pub type Intention {
  /// The client only wants status information about the server
  Status
  /// The client wants to go through the typical login flow
  Login
  /// The client was transferred to this server from another server
  Transfer
}

pub fn from_int(int: Int) {
  case int {
    0 -> Ok(Status)
    1 -> Ok(Login)
    2 -> Ok(Transfer)
    _ -> Error(error.InvalidEnumValue("Intention", min: 0, max: 2, value: int))
  }
}
