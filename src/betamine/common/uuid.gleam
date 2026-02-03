import gleam/bit_array
import gleam/dynamic/decode
import gleam/order
import gleam/result
import youid/uuid

pub opaque type Uuid {
  Uuid(value: BitArray)
}

pub const default = Uuid(<<0x40008000000000000000:size(128)>>)

fn from_string_decoder() {
  use string <- decode.then(decode.string)
  case from_string(string) {
    Ok(uuid) -> decode.success(uuid)
    Error(_) -> decode.failure(default, "Uuid")
  }
}

fn from_bit_array_decoder() {
  use bit_array <- decode.then(decode.bit_array)
  case from_bit_array(bit_array) {
    Ok(uuid) -> decode.success(uuid)
    Error(_) -> decode.failure(default, "Uuid")
  }
}

fn from_int_decoder() {
  use int <- decode.then(decode.int)
  case from_bit_array(<<int:size(128)>>) {
    Ok(uuid) -> decode.success(uuid)
    Error(_) -> decode.failure(default, "Uuid")
  }
}

pub fn decoder() -> decode.Decoder(Uuid) {
  decode.one_of(from_string_decoder(), or: [
    from_bit_array_decoder(),
    from_int_decoder(),
  ])
}

fn from_youid(uuid: uuid.Uuid) {
  uuid |> uuid.to_bit_array |> Uuid
}

fn to_youid(uuid: Uuid) {
  uuid.from_bit_array(uuid.value)
}

pub fn to_string(uuid: Uuid) -> String {
  uuid.to_string(to_youid(uuid) |> result.unwrap(uuid.v4()))
}

pub fn from_string(string: String) -> Result(Uuid, Nil) {
  uuid.from_string(string)
  |> result.map(from_youid)
}

pub fn to_bit_array(uuid: Uuid) -> BitArray {
  uuid.value
}

pub fn from_bit_array(bit_array: BitArray) -> Result(Uuid, Nil) {
  uuid.from_bit_array(bit_array)
  |> result.map(from_youid)
}

pub fn is_equal(a: Uuid, b: Uuid) -> Bool {
  case bit_array.compare(a.value, b.value) {
    order.Eq -> True
    _ -> False
  }
}
