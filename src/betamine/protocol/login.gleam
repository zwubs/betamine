import betamine/decoder as decode
import betamine/encoder as encode
import gleam/bytes_builder
import gleam/result

pub type LoginRequest {
  LoginRequest(name: String, uuid: Int)
}

pub fn deserialize(bit_array: BitArray) {
  use #(name, bit_array) <- result.try(decode.string(bit_array))
  use #(uuid, _) <- result.try(decode.uuid(bit_array))
  Ok(LoginRequest(name, uuid))
}

pub fn serialize(name: String, uuid: Int) {
  encode.uuid(bytes_builder.new(), uuid)
  |> encode.string(name)
  |> encode.var_int(0)
  |> encode.var_int(1)
}
