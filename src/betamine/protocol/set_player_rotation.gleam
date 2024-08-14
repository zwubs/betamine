import betamine/common/rotation.{type Rotation, Rotation}
import betamine/decoder as decode
import gleam/result

pub type PlayerRotation {
  PlayerRotation(rotation: Rotation, on_ground: Bool)
}

pub fn deserialize(bit_array: BitArray) {
  use #(yaw, bit_array) <- result.try(decode.float(bit_array))
  use #(pitch, bit_array) <- result.try(decode.float(bit_array))
  let rotation = Rotation(pitch, yaw)
  use #(on_ground, _) <- result.try(decode.boolean(bit_array))
  Ok(PlayerRotation(rotation, on_ground))
}
