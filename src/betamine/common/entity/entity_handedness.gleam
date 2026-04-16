import betamine/common/enum

pub const enum = enum.Enum("EntityHandedness", 0, 1, from_int, to_int)

pub type EntityHandedness {
  Left
  Right
}

pub fn from_int(int: Int) {
  case int {
    0 -> Ok(Left)
    1 -> Ok(Right)
    _ -> Error(Nil)
  }
}

pub fn to_int(handedness: EntityHandedness) {
  case handedness {
    Left -> 0
    Right -> 1
  }
}
