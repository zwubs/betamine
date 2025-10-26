import betamine/common/identifier
import betamine/common/math/vector3.{type Vector3}
import betamine/common/uuid
import betamine/protocol/encoder
import betamine/protocol/error
import gleam/bytes_tree.{type BytesTree}
import gleam/float
import gleam/result

pub fn encode_velocity(tree: BytesTree, velocity: Vector3(Float)) {
  velocity
  |> vector3.map(fn(value) { float.clamp(value, -3.9, 3.9) *. 8000.0 })
  |> vector3.truncate
  |> vector3.fold(tree, encoder.short)
}

pub fn encode_delta(tree: BytesTree, delta: Vector3(Float)) {
  delta
  |> vector3.map(fn(value) { value *. 4096.0 })
  |> vector3.truncate
  |> vector3.fold(tree, encoder.short)
}

pub fn encode_uuid(tree: BytesTree, uuid: uuid.Uuid) {
  bytes_tree.append(tree, uuid.to_bit_array(uuid))
}

pub fn decode_uuid(bit_array: BitArray) {
  case bit_array {
    <<bytes:bytes-size(16), bit_array:bytes>> -> {
      uuid.from_bit_array(bytes)
      |> result.map(fn(bytes) { #(bytes, bit_array) })
      |> result.replace_error(error.InvalidUUID(bytes))
    }
    _ -> Error(error.EndOfData)
  }
}

pub fn encode_identifier(tree: BytesTree, identifier: identifier.Identifier) {
  encoder.string(tree, identifier.to_string(identifier))
}
