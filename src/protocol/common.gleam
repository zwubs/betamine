import betamine/common/vector3.{type Vector3}
import betamine/encoder
import gleam/bytes_builder.{type BytesBuilder}
import gleam/float

pub fn encode_velocity(builder: BytesBuilder, velocity: Vector3(Float)) {
  velocity
  |> vector3.map(fn(value) { float.clamp(value, -3.9, 3.9) *. 8000.0 })
  |> vector3.truncate
  |> vector3.fold(builder, encoder.short)
}

pub fn encode_delta(builder, delta: Vector3(Float)) {
  delta
  |> vector3.map(fn(value) { value *. 4096.0 })
  |> vector3.truncate
  |> vector3.fold(builder, encoder.short)
}
