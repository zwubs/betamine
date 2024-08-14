import betamine/common/position.{type Position, Position}
import betamine/common/rotation.{type Rotation, Rotation}
import betamine/decoder as decode
import gleam/result

pub type PlayerPositionAndRotation {
  PlayerPositionAndRotation(
    position: Position,
    rotation: Rotation,
    on_ground: Bool,
  )
}

pub fn deserialize(bit_array: BitArray) {
  use #(x, bit_array) <- result.try(decode.double(bit_array))
  use #(y, bit_array) <- result.try(decode.double(bit_array))
  use #(z, bit_array) <- result.try(decode.double(bit_array))
  let position = Position(x, y, z)
  use #(yaw, bit_array) <- result.try(decode.float(bit_array))
  use #(pitch, bit_array) <- result.try(decode.float(bit_array))
  let rotation = Rotation(pitch, yaw)
  use #(on_ground, _) <- result.try(decode.boolean(bit_array))
  Ok(PlayerPositionAndRotation(position, rotation, on_ground))
}
