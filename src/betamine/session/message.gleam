import betamine/common/chunk_position
import betamine/common/math/vector3
import betamine/common/rotation
import betamine/protocol/common/chunk
import gleam/option

pub type PlayerEvent {
  ChunkLoaded(chunk.Chunk)
  ChunkUnloaded(chunk_position.ChunkPosition)
  CenterChunkChanged(chunk_position.ChunkPosition)
  EntityMoved(
    id: Int,
    position_delta: option.Option(vector3.Vector3(Float)),
    rotation: option.Option(rotation.Rotation),
    on_ground: Bool,
  )
}
