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
  int.absolute_value(int.max(b.x - a.x, b.z - a.z))
}
