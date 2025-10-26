import betamine/common/entity.{type Entity}
import betamine/common/entity/entity_metadata
import betamine/common/entity/player.{type Player}
import betamine/common/entity/player/player_game_mode
import betamine/handlers/entity_handler
import betamine/protocol/packets/clientbound.{type Packet}
import gleam/option
import gleam/set

pub fn handle_add(player: Player) -> Packet {
  clientbound.PlayerInfoUpdate(
    clientbound.PlayerInfoUpdatePacket(
      actions: set.from_list([clientbound.AddPlayer]),
      entries: [
        clientbound.PlayerInfoUpdateEntry(
          uuid: player.entity.uuid,
          name: player.name,
          latency: 0,
          visible_on_player_list: True,
          profile: player.profile,
          game_mode: player_game_mode.Survival,
          chat_session: option.None,
          display_name: option.Some(player.name),
        ),
      ],
    ),
  )
}

pub fn handle_spawn(player: Player) -> List(Packet) {
  [handle_add(player), entity_handler.handle_spawn(player.entity)]
}

pub fn handle_metadata_update(player: Player) -> Packet {
  clientbound.SetEntityMetadata(clientbound.SetEntityMetadataPacket(
    player.entity.id,
    entity_metadata.to_protocol(player.entity.metadata),
  ))
}

pub fn handle_disconnect(player: Player) -> List(Packet) {
  [
    clientbound.PlayerInfoRemove(
      clientbound.PlayerInfoRemovePacket([player.entity.uuid]),
    ),
    clientbound.RemoveEntities(
      clientbound.RemoveEntitiesPacket([player.entity.id]),
    ),
  ]
}
