import betamine/common/entity.{type Entity}
import betamine/common/player.{type Player}
import betamine/common/rotation.{type Rotation}
import betamine/common/vector3.{type Vector3}
import betamine/game/update
import gleam/erlang/process.{type Subject}

pub type Command {
  Tick
  SpawnPlayer(
    subject: Subject(update.Update),
    player_subject: Subject(#(Player, Entity)),
    uuid: Int,
    name: String,
  )
  RemovePlayer(uuid: Int, subject: Subject(update.Update))
  MoveEntity(entity_id: Int, position: Vector3(Float), on_ground: Bool)
  RotateEntity(entity_id: Int, rotation: Rotation, on_ground: Bool)
  GetAllPlayers(subject: Subject(List(Player)))
  GetAllEntities(subject: Subject(List(Entity)))
  Shutdown
}
