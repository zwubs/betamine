pub type Handshake

pub type Status

pub type Login

pub type Configuration

pub type Play

/// Represents the different phases a client's connection can be in.
/// These change through the connection's life time, typically sequentially.
/// They are necessary to decode properly decode packets as the ids change per phase.
pub type Phase {
  Handshake
  Status
  Login
  Configuration
  Play
}

pub fn to_int(phase: Phase) -> Int {
  case phase {
    Handshake -> 0
    Status -> 1
    Login -> 2
    Configuration -> 3
    Play -> 4
  }
}

pub fn from_int(int: Int) -> Result(Phase, Int) {
  case int {
    0 -> Ok(Handshake)
    1 -> Ok(Status)
    2 -> Ok(Login)
    3 -> Ok(Configuration)
    4 -> Ok(Play)
    _ -> Error(int)
  }
}
