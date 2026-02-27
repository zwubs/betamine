import betamine/common/chunk_position
import betamine/common/entity
import betamine/common/math/vector3
import betamine/common/rotation
import betamine/protocol/common/chunk
import gleam/erlang/process
import gleam/option

pub type Message {
  KeepAlive
  ChunkLoaded(chunk.Chunk)
  ChunkUnloaded(chunk_position.ChunkPosition)
  CenterChunkChanged(chunk_position.ChunkPosition)
  EntitySpawned(entity: entity.Entity)
  EntityMoved(
    id: Int,
    position_delta: option.Option(vector3.Vector3(Float)),
    rotation: option.Option(rotation.Rotation),
    on_ground: Bool,
  )
}

pub type Subject =
  process.Subject(Message)
