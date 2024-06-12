import gleam/bytes_builder
import gleam/pair
import gleeunit/should
import glime/decoder
import glime/encoder

pub fn decode_var_int_unsigned_test() {
  decoder.var_int(<<0xE5, 0x8E, 0x26>>)
  |> should.be_ok()
  |> pair.first
  |> should.equal(624_485)
}

pub fn decode_var_int_signed_test() {
  decoder.var_int(<<0xC0, 0xBB, 0x78>>)
  |> should.be_ok()
  |> pair.first
  |> should.equal(-123_456)
}

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
// pub fn decode_uuid_signed_test() {
//   let builder = bytes_builder.new()
//   encoder.uuid(builder, 150_388_119_113_155_024_007_511_140_673_882_550_015)
//   |> bytes_builder.to_bit_array
//   |> should.equal(<<0x7123B2BC730D4308A81BAE612EC1EEFF>>)
// }
