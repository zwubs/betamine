import betamine/common/player.{type Player}
import betamine/game/update
import gleam/erlang/process.{type Subject}

pub type Command {
  Tick
  SpawnPlayer(
    subject: Subject(update.Update),
    player_subject: Subject(Player),
    uuid: Int,
    name: String,
  )
  Shutdown
}
