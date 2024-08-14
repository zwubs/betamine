pub type Position {
  Position(x: Float, y: Float, z: Float)
}

pub fn equal(a: Position, b: Position) {
  a.x == b.x && a.y == b.y && a.z == b.z
}
