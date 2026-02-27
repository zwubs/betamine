import betamine/common/client_information
import betamine/common/entity
import betamine/common/math/vector3
import betamine/common/position
import betamine/common/profile
import betamine/common/rotation
import betamine/common/uuid
import betamine/protocol/common/chunk
import betamine/session/message as session_message
import gleam/erlang/process
import gleam/option
import gleam/otp/actor

pub type PlayerMessage {
  Stop
  ChunkLoaded(chunk.Chunk)
  PlayerMoved(
    uuid: uuid.Uuid,
    entity_id: Int,
    position_delta: option.Option(vector3.Vector3(Float)),
    rotation: option.Option(rotation.Rotation),
    on_ground: Bool,
  )
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

pub type PlayerSubject =
  process.Subject(PlayerMessage)

pub type ManagerMessage {
  NewPlayer(
    return_subject: process.Subject(
      Result(#(PlayerSubject, profile.Profile), actor.StartError),
    ),
    uuid: uuid.Uuid,
    session_subject: process.Subject(session_message.Message),
  )
  StopPlayer(uuid: uuid.Uuid)
  GetPlayerList(return_subject: process.Subject(List(#(uuid.Uuid, String))))
  GetAllPlayers(return_subject: process.Subject(List(#(uuid.Uuid, String))))
  // Temporary message to allow players to communicate with one another.
  MessageOtherPlayers(uuid: uuid.Uuid, message: PlayerMessage)
}

pub type ManagerSubject =
  process.Subject(ManagerMessage)

pub type ManagerName =
  process.Name(ManagerMessage)
