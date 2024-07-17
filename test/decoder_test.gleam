import betamine/decoder
import gleam/pair
import gleeunit/should

fn decode_var_int(bit_array: BitArray) {
  decoder.var_int(bit_array)
  |> should.be_ok()
  |> pair.first
}

pub fn decode_var_int_min_test() {
  decode_var_int(<<0x80, 0x80, 0x80, 0x80, 0x08>>)
  |> should.equal(-2_147_483_648)
}

pub fn decode_var_int_max_test() {
  decode_var_int(<<0xFF, 0xFF, 0xFF, 0xFF, 0x07>>)
  |> should.equal(2_147_483_647)
}

pub fn decode_var_int_one_test() {
  decode_var_int(<<0x81, 0x00>>)
  |> should.equal(1)
}

pub fn decode_var_int_negative_one_test() {
  decode_var_int(<<0xFF, 0xFF, 0xFF, 0xFF, 0x0F>>)
  |> should.equal(-1)
}
