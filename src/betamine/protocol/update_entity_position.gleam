import betamine/common/position.{type Position}
import betamine/encoder as encode
import gleam/bytes_builder
import gleam/float

pub type UpdateEntityPosition {
  UpdateEntityPosition(
    entity_id: Int,
    old_position: Position,
    new_position: Position,
    is_grounded: Bool,
  )
}

fn compute_delta(new: Float, old: Float) {
  float.truncate(new *. 4096.0 -. old *. 4096.0)
}

pub fn serialize(request: UpdateEntityPosition) {
  let delta_x = compute_delta(request.new_position.x, request.old_position.x)
  let delta_y = compute_delta(request.new_position.y, request.old_position.y)
  let delta_z = compute_delta(request.new_position.z, request.old_position.z)

  bytes_builder.new()
  // Entity Id
  |> encode.var_int(request.entity_id)
  // Delta Position
  |> encode.short(delta_x)
  |> encode.short(delta_y)
  |> encode.short(delta_z)
  // Is On Ground
  |> encode.bool(request.is_grounded)
}
