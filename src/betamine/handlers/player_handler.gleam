import betamine/common/entity.{type Entity}
import betamine/common/game_mode
import betamine/common/player.{type Player}
import betamine/common/profile
import betamine/handlers/entity_handler
import betamine/protocol/packets/clientbound.{type Packet}
import gleam/option
import gleam/set

pub fn handle_spawn(player: Player, entity: Entity) -> List(Packet) {
  [
    clientbound.PlayerInfoUpdate(
      clientbound.PlayerInfoUpdatePacket(
        actions: set.from_list([clientbound.AddPlayer]),
        entries: [
          clientbound.PlayerInfoUpdateEntry(
            uuid: player.uuid,
            name: player.name,
            latency: 0,
            visible_on_player_list: True,
            profile: profile.Profile(player.uuid, player.name, properties: []),
            game_mode: game_mode.Survival,
            chat_session: option.None,
            display_name: option.Some(player.name),
          ),
        ],
      ),
    ),
    entity_handler.handle_spawn(entity),
  ]
}

pub fn handle_disconnect(player: Player) -> List(Packet) {
  [
    clientbound.PlayerInfoRemove(
      clientbound.PlayerInfoRemovePacket([player.uuid]),
    ),
    clientbound.RemoveEntities(
      clientbound.RemoveEntitiesPacket([player.entity_id]),
    ),
  ]
}
