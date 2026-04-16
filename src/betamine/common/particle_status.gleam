import betamine/common/enum

pub const enum = enum.Enum("ParticleStatus", 0, 2, from_int, to_int)

pub type ParticleStatus {
  All
  Decreased
  Minimal
}

pub fn from_int(int: Int) {
  case int {
    0 -> Ok(All)
    1 -> Ok(Decreased)
    2 -> Ok(Minimal)
    _ -> Error(Nil)
  }
}

pub fn to_int(particle_status: ParticleStatus) {
  case particle_status {
    All -> 0
    Decreased -> 1
    Minimal -> 2
  }
}
