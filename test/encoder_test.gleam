import betamine/encoder
import gleam/bytes_builder
import gleeunit/should

pub fn encode_var_int_unsigned_test() {
  let builder = bytes_builder.new()
  encoder.var_int(builder, 624_485)
  |> bytes_builder.to_bit_array
  |> should.equal(<<0xE5, 0x8E, 0x26>>)
}

pub fn encode_var_int_signed_test() {
  let builder = bytes_builder.new()
  encoder.var_int(builder, -123_456)
  |> bytes_builder.to_bit_array
  |> should.equal(<<0xC0, 0xBB, 0x78>>)
}
