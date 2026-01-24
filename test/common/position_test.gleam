import betamine/common/block_position.{type BlockPosition}
import betamine/common/math/vector3.{Vector3}
import gleeunit/should

const position: BlockPosition = Vector3(18_357_644, 831, -20_882_616)

pub fn to_int_test() {
  block_position.to_int(position)
  |> should.equal(5_046_110_948_485_792_575)
}

pub fn to_int_zero_test() {
  block_position.to_int(block_position.default)
  |> should.equal(0)
}

pub fn to_bit_array_test() {
  block_position.to_bit_array(position)
  |> should.equal(<<
    0b01000110000001110110001100:size(26),
    0b10110000010101101101001000:size(26),
    0b001100111111:size(12),
  >>)
}

pub fn to_bit_array_zero_test() {
  block_position.to_bit_array(block_position.default)
  |> should.equal(<<0:size(64)>>)
}
