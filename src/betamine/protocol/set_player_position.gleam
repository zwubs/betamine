import betamine/decoder as decode
import gleam/result

pub type PlayerPosition {
  PlayerPosition(x: Float, y: Float, z: Float, on_ground: Bool)
}

pub fn deserialize(bit_array: BitArray) {
  use #(x, bit_array) <- result.try(decode.double(bit_array))
  use #(y, bit_array) <- result.try(decode.double(bit_array))
  use #(z, bit_array) <- result.try(decode.double(bit_array))
  use #(on_ground, _) <- result.try(decode.boolean(bit_array))
  Ok(PlayerPosition(x, y, z, on_ground))
}
