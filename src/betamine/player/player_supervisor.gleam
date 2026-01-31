import betamine/player/player_factory
import betamine/player/player_manager
import gleam/otp/static_supervisor
import gleam/otp/supervision

pub fn supervised(
  player_factory_name: player_factory.Name,
  player_manager_name: player_manager.Name,
) {
  supervision.supervisor(fn() {
    start(player_factory_name, player_manager_name)
  })
}

pub fn start(
  player_factory_name: player_factory.Name,
  player_manager_name: player_manager.Name,
) {
  let player_factory = player_factory.supervised(player_factory_name)

  let player_manager =
    player_manager.supervised(player_manager_name, player_factory_name)

  static_supervisor.new(static_supervisor.OneForOne)
  |> static_supervisor.add(player_factory)
  |> static_supervisor.add(player_manager)
  |> static_supervisor.start()
}
