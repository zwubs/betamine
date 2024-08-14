import betamine/common/position.{type Position, Position}
import betamine/decoder as decode
import gleam/result

pub type PlayerPosition {
  PlayerPosition(position: Position, on_ground: Bool)
}

pub fn deserialize(bit_array: BitArray) {
  use #(x, bit_array) <- result.try(decode.double(bit_array))
  use #(y, bit_array) <- result.try(decode.double(bit_array))
  use #(z, bit_array) <- result.try(decode.double(bit_array))
  let position = Position(x, y, z)
  use #(on_ground, _) <- result.try(decode.boolean(bit_array))
  Ok(PlayerPosition(position, on_ground))
}
