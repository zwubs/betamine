import betamine/common/client_information
import betamine/common/entity
import betamine/common/position
import betamine/common/profile
import betamine/common/rotation
import betamine/protocol/common/chunk
import gleam/erlang/process
import gleam/option

pub type WorldEvent {
  ChunkLoaded(chunk.Chunk)
}

pub type SessionCommand {
  UpdateClientInformation(
    client_information: client_information.ClientInformation,
  )
  GetSpawnInformation(
    return_subject: process.Subject(
      #(profile.Profile, client_information.ClientInformation, entity.Entity),
    ),
  )
  LoadInitialChunks
  Move(
    position: option.Option(position.Position),
    rotation: option.Option(rotation.Rotation),
    on_ground: Bool,
    against_wall: Bool,
  )
}
