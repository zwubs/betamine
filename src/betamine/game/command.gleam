import betamine/common/entity.{type Entity}
import betamine/common/entity/player.{type Player}
import betamine/common/math/vector3.{type Vector3}
import betamine/common/rotation.{type Rotation}
import betamine/common/uuid
import betamine/game/update
import gleam/erlang/process.{type Subject}

pub type Command {
  Tick
  SpawnPlayer(
    subject: Subject(update.Update),
    player_subject: Subject(Player),
    uuid: uuid.Uuid,
    name: String,
  )
  RemovePlayer(uuid: uuid.Uuid, subject: Subject(update.Update))
  MovePlayer(uuid: uuid.Uuid, position: Vector3(Float), on_ground: Bool)
  RotatePlayer(uuid: uuid.Uuid, rotation: Rotation, on_ground: Bool)
  GetAllPlayers(subject: Subject(List(Player)))
  UpdatePlayerSneaking(uuid: uuid.Uuid, sneaking: Bool)
  SwingPlayerArm(uuid: uuid.Uuid, is_dominant: Bool)
  Shutdown
}
