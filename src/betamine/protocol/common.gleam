import betamine/common/identifier
import betamine/common/profile
import betamine/common/uuid
import betamine/common/vector3.{type Vector3}
import betamine/protocol/encoder
import betamine/protocol/error
import gleam/bytes_tree.{type BytesTree}
import gleam/float
import gleam/result
import gleam/string

pub fn encode_vector3(
  tree: BytesTree,
  vector3: Vector3(a),
  encoder: fn(BytesTree, a) -> BytesTree,
) {
  vector3.fold(vector3, tree, encoder)
}

pub fn encode_velocity(tree: BytesTree, velocity: Vector3(Float)) {
  velocity
  |> vector3.map(fn(value) { float.clamp(value, -3.9, 3.9) *. 8000.0 })
  |> vector3.truncate
  |> encode_vector3(tree, _, encoder.short)
}

pub fn encode_delta(tree: BytesTree, delta: Vector3(Float)) {
  delta
  |> vector3.map(fn(value) { value *. 4096.0 })
  |> vector3.truncate
  |> encode_vector3(tree, _, encoder.short)
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

pub fn encode_profile(tree: BytesTree, profile: profile.Profile) {
  tree
  |> encode_uuid(profile.id)
  |> encoder.string(string.slice(profile.name, 0, 16))
  |> encoder.array(profile.properties, encode_profile_property)
}

pub fn encode_profile_property(
  tree: BytesTree,
  property: profile.ProfileProperty,
) {
  tree
  |> encoder.string(property.name)
  |> encoder.string(property.value)
  |> encoder.optional(property.signature, encoder.string)
}
