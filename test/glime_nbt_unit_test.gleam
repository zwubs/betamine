import birdie
import gleam/bit_array
import gleam/io
import gleam/result
import gleeunit
import gleeunit/should
import nbt.{byte, compound, double, float, list, long, nbt, string}

pub fn main() {
  gleeunit.main()
}

const hello_world_nbt = <<
  0x0A, 0x00, 0x0B, 0x68, 0x65, 0x6C, 0x6C, 0x6F, 0x20, 0x77, 0x6F, 0x72, 0x6C,
  0x64, 0x08, 0x00, 0x04, 0x6E, 0x61, 0x6D, 0x65, 0x00, 0x09, 0x42, 0x61, 0x6E,
  0x61, 0x6E, 0x72, 0x61, 0x6D, 0x61, 0x00,
>>

pub type HelloWorldNbt {
  HelloWorldNbt(hello_world: HelloWorld)
}

pub type HelloWorld {
  HelloWorld(name: String)
}

// pub fn decode_hello_world_test() {
//   todo
// let hello_world_decoder =
//   dynamic.decode1(HelloWorld, dynamic.field("name", nbt.string))
// use result <- result.then(
//   nbt.decode(nbt)
//   |> result.replace_error([dynamic.DecodeError("NBT", "bit array", [])]),
// )
// }

pub fn encode_hello_world_test() {
  let nbt = nbt("hello world", compound([#("name", string("Bananrama"))]))
  use encoded_nbt <- result.try(nbt.encode(nbt))
  should.equal(
    bit_array.inspect(encoded_nbt),
    bit_array.inspect(hello_world_nbt),
  )
  Ok(Nil)
}

pub fn encode_byte_test() {
  let nbt = nbt("", compound([#("a", byte(<<127>>)), #("b", byte(<<127>>))]))
  use encoded_nbt <- result.try(nbt.encode(nbt))
  bit_array.inspect(encoded_nbt)
  |> birdie.snap(title: "nbt encoding byte")
  Ok(Nil)
}

pub fn encode_big_test() {
  let _big_test =
    nbt(
      "Level",
      compound([
        #("byteTest", byte(<<127>>)),
        #("doubleTest", double(0.49312871321823148)),
        #("floatTest", float(0.49823147058486938)),
        #("listTest", list(long, [0, 0])),
      ]),
    )
  // use encoded_nbt <- result.try(nbt.encode(big_test))
  // io.debug(bit_array.inspect(encoded_nbt))
  // Ok(Nil)
}
