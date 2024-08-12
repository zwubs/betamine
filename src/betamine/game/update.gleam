import betamine/common/entity.{type Entity}
import betamine/common/player.{type Player}

pub type Update {
  PlayerSpawned(player: Player, entity: Entity)
  Player
}
