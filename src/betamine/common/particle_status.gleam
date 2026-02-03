import betamine/protocol/error

pub type ParticleStatus {
  All
  Decreased
  Minimal
}

pub fn to_int(particle_status: ParticleStatus) {
  case particle_status {
    All -> 0
    Decreased -> 1
    Minimal -> 2
  }
}

pub fn from_int(int: Int) {
  case int {
    0 -> Ok(All)
    1 -> Ok(Decreased)
    2 -> Ok(Minimal)
    _ ->
      Error(error.InvalidEnumValue("ParticleStatus", min: 0, max: 2, value: int))
  }
}
