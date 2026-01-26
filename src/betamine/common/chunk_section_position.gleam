import betamine/common/block_position
import betamine/common/math/vector3
import gleam/int

pub type ChunkSectionPosition {
  ChunkSectionPosition(x: Int, y: Int, z: Int)
}

pub fn new(x: Int, y: Int, z: Int) {
  ChunkSectionPosition(x, y, z)
}

pub const default = ChunkSectionPosition(0, 0, 0)

pub fn from_block_position(block_position: block_position.BlockPosition) {
  let vector3 = vector3.map(block_position, int.bitwise_shift_right(_, 4))
  ChunkSectionPosition(x: vector3.x, y: vector3.y, z: vector3.z)
}

pub fn to_block_position(position: ChunkSectionPosition) {
  vector3.Vector3(position.x, position.y, position.z)
  |> vector3.map(int.multiply(_, 16))
}
