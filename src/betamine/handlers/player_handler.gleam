import betamine/common/entity/player
import betamine/common/entity/player/player_game_mode
import betamine/common/profile
import betamine/common/uuid
import betamine/handlers/entity_handler
import betamine/protocol/packets/clientbound.{type Packet}
import gleam/option
import gleam/set

pub fn handle_add(profile: profile.Profile) -> Packet {
  clientbound.PlayerInfoUpdate(
    clientbound.PlayerInfoUpdatePacket(
      actions: set.from_list([
        clientbound.AddPlayer,
        clientbound.UpdateListed,
        clientbound.UpdateHat,
      ]),
      entries: [
        clientbound.PlayerInfoUpdateEntry(
          uuid: profile.id,
          name: profile.name,
          latency: 0,
          visible_on_player_list: True,
          profile: profile,
          game_mode: player_game_mode.Survival,
          chat_session: option.None,
          display_name: option.Some(profile.name),
          hat_visible: True,
        ),
      ],
    ),
  )
}

pub fn handle_spawn(player: player.Player) -> List(Packet) {
  [handle_add(player.profile), entity_handler.handle_spawn(player.entity)]
}

pub fn handle_disconnect(uuid: uuid.Uuid, entity_id: Int) -> List(Packet) {
  [
    clientbound.PlayerInfoRemove(clientbound.PlayerInfoRemovePacket([uuid])),
    clientbound.RemoveEntities(clientbound.RemoveEntitiesPacket([entity_id])),
  ]
}
