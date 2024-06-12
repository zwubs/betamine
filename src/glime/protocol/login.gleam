import gleam/bytes_builder
import gleam/result
import glime/decoder as decode
import glime/encoder as encode

pub type LoginRequest {
  LoginRequest(name: String, uuid: Int)
}

pub fn deserialize(bit_array: BitArray) {
  use #(name, bit_array) <- result.try(decode.string(bit_array))
  use #(uuid, _) <- result.try(decode.uuid(bit_array))
  Ok(LoginRequest(name, uuid))
}

pub fn serialize(login_request: LoginRequest) {
  encode.uuid(bytes_builder.new(), login_request.uuid)
  |> encode.string(login_request.name)
  |> encode.var_int(0)
  |> encode.var_int(1)
}
