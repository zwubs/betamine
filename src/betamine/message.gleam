import betamine/common/block/block_state
import betamine/common/block_position
import betamine/common/chunk_position
import betamine/common/entity/entity_animation
import betamine/common/entity/entity_handedness
import betamine/common/entity/entity_metadata
import betamine/common/entity/player
import betamine/common/entity/player/player_model_customization
import betamine/common/math/vector3
import betamine/common/rotation
import betamine/common/uuid
import betamine/protocol/common/chunk
import gleam/erlang/process

pub type PlayerSessionMessage {
  PlayerSpawned(player: player.Player)
  PlayerDisconnected(uuid: uuid.Uuid, entity_id: Int)
  EntityMetadataUpdated(
    entity_id: Int,
    metadata: entity_metadata.EntityMetadata,
  )
  EntityPositionUpdated(
    entity_id: Int,
    delta: vector3.Vector3(Float),
    on_ground: Bool,
  )
  EntityRotationUpdated(
    entity_id: Int,
    rotation: rotation.Rotation,
    on_ground: Bool,
  )
  EntityAnimationTriggered(
    entity_id: Int,
    animation: entity_animation.EntityAnimation,
  )
}

pub type GameMessage {
  SpawnPlayer(
    session_subject: process.Subject(PlayerSessionMessage),
    player_subject: process.Subject(player.Player),
    uuid: uuid.Uuid,
  )
  StartRecievingUpdates(uuid: uuid.Uuid)
  RemovePlayer(uuid: uuid.Uuid)
  MovePlayer(uuid: uuid.Uuid, position: vector3.Vector3(Float), on_ground: Bool)
  RotatePlayer(uuid: uuid.Uuid, rotation: rotation.Rotation, on_ground: Bool)
  GetAllPlayers(subject: process.Subject(List(player.Player)))
  UpdatePlayerSneaking(uuid: uuid.Uuid, sneaking: Bool)
  UpdatePlayerModelCustomization(
    uuid: uuid.Uuid,
    model_customization: player_model_customization.PlayerModelCustomization,
  )
  UpdatePlayerMainHand(
    uuid: uuid.Uuid,
    handedness: entity_handedness.EntityHandedness,
  )
  SwingPlayerArm(uuid: uuid.Uuid, is_dominant: Bool)
}

pub type WorldMessage {
  GenerateWorld
  GetAllChunks(
    subject: process.Subject(List(#(chunk_position.ChunkPosition, chunk.Chunk))),
  )
  GetChunk(
    subject: process.Subject(chunk.Chunk),
    chunk_position: chunk_position.ChunkPosition,
  )
  GetBlock(
    subject: process.Subject(Result(block_state.BlockState, Nil)),
    block_position: block_position.BlockPosition,
  )
  PlaceBlock(
    subject: process.Subject(Result(block_state.BlockState, Nil)),
    block_position: block_position.BlockPosition,
    state: block_state.BlockState,
  )
}
