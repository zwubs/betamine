import betamine/common/math/vector3.{type Vector3}
import gleam/int

pub type Position =
  Vector3(Int)

const bits_26 = 0b11111111111111111111111111

const bits_12 = 0b111111111111

pub const default = vector3.Vector3(0, 0, 0)

pub fn to_bit_array(position: Position) {
  <<position.x:int-size(26), position.z:int-size(26), position.y:int-size(12)>>
}

pub fn to_int(position: Position) {
  int.bitwise_and(position.y, bits_12)
  + int.bitwise_shift_left(int.bitwise_and(position.z, bits_26), 12)
  + int.bitwise_shift_left(int.bitwise_and(position.x, bits_26), 38)
}
