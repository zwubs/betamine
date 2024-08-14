import betamine/common/player.{type Player}
import betamine/encoder as encode
import gleam/bytes_builder
import gleam/list

pub fn serialize(players: List(Player)) {
  bytes_builder.new()
  // Action (Add Player)
  |> encode.byte(0b00000001)
  // Player Count
  |> encode.var_int(list.length(players))
  |> list.fold(
    players,
    _,
    fn(builder, player) {
      builder
      |> encode.uuid(player.uuid)
      |> encode.string(player.name)
      // Properties
      |> encode.var_int(0)
    },
  )
}
