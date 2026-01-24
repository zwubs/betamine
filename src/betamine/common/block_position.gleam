import betamine/common/math/vector3.{type Vector3}
import betamine/common/position
import gleam/float
import gleam/int

pub type BlockPosition =
  Vector3(Int)

pub fn from_position(position: position.Position) {
  vector3.map(position, fn(f) { float.truncate(float.floor(f)) })
}

const bits_26 = 0b11111111111111111111111111

const bits_12 = 0b111111111111

pub const default = vector3.Vector3(0, 0, 0)

pub fn to_bit_array(position: BlockPosition) {
  <<
    position.x:int-size(26),
    position.z:int-size(26),
    position.y:int-size(12),
  >>
}

pub fn to_int(position: BlockPosition) {
  int.bitwise_and(position.y, bits_12)
  + int.bitwise_shift_left(int.bitwise_and(position.z, bits_26), 12)
  + int.bitwise_shift_left(int.bitwise_and(position.x, bits_26), 38)
}
