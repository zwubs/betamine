import betamine/game
import betamine/host
import gleam/erlang/process
import gleam/io

pub fn main() {
  let assert Ok(game_subject) = game.start()
  let assert Ok(_) = host.start(game_subject)
  io.println("Betamine listening on port: 25565")
  process.sleep_forever()
}
