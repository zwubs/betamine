import betamine/common/block_position
import betamine/common/math/vector3
import betamine/common/position
import gleam/int

pub type ChunkPosition {
  ChunkPosition(x: Int, z: Int)
}

pub fn new(x: Int, z: Int) {
  ChunkPosition(x, z)
}

pub const default = ChunkPosition(0, 0)

pub fn from_position(position: position.Position) {
  block_position.from_position(position)
  |> from_block_position()
}

pub fn from_block_position(block_position: block_position.BlockPosition) {
  let vector3 = vector3.map(block_position, int.bitwise_shift_right(_, 4))
  ChunkPosition(x: vector3.x, z: vector3.z)
}

pub fn chebyshev_distance(a: ChunkPosition, b: ChunkPosition) {
  int.max(int.absolute_value(b.x - a.x), int.absolute_value(b.z - a.z))
}

pub fn to_string(chunk_position: ChunkPosition) {
  "ChunkPosition("
  <> int.to_string(chunk_position.x)
  <> ", "
  <> int.to_string(chunk_position.z)
  <> ")"
}
