import betamine/common/chat/chat_session
import betamine/common/chunk
import betamine/common/difficulty.{type Difficulty}
import betamine/common/entity/entity_animation
import betamine/common/entity/entity_kind
import betamine/common/entity/player/player_game_mode
import betamine/common/identifier
import betamine/common/profile
import betamine/common/rotation.{type Rotation}
import betamine/common/uuid
import betamine/common/vector3.{type Vector3}
import betamine/constants
import betamine/protocol/common
import betamine/protocol/common/entity/entity_metadata
import betamine/protocol/common/game_event
import betamine/protocol/encoder
import gleam/bytes_tree.{type BytesTree}
import gleam/int
import gleam/json
import gleam/list
import gleam/option.{type Option, None}
import gleam/set

pub type Packet {
  StatusResponse(packet: StatusResponsePacket)
  StatusPong(packet: StatusPongPacket)
  LoginSuccess(packet: LoginSuccessPacket)
  Plugin(packet: PluginPacket)
  FeatureFlags(packet: FeatureFlagsPacket)
  KnownDataPacks(packet: KnownDataPacksPacket)
  Registry(packet: RegistryPacket)
  FinishConfiguration
  Login(packet: LoginPacket)
  ChangeDifficulty(packet: ChangeDifficultyPacket)
  GameEvent(packet: GameEventPacket)
  SetCenterChunk(packet: SetCenterChunkPacket)
  LevelChunkWithLight(packet: LevelChunkWithLightPacket)
  PlayerInfoRemove(packet: PlayerInfoRemovePacket)
  PlayerInfoUpdate(packet: PlayerInfoUpdatePacket)
  SynchronizePlayerPosition(packet: SynchronizePlayerPositionPacket)
  SpawnEntity(packet: SpawnEntityPacket)
  UpdateEntityPosition(packet: UpdateEntityPositionPacket)
  UpdateEntityRotation(packet: UpdateEntityRotationPacket)
  SetHeadRotation(packet: SetHeadRotationPacket)
  RemoveEntities(packet: RemoveEntitiesPacket)
  PlayKeepAlive(packet: PlayKeepAlivePacket)
  SetEntityMetadata(packet: SetEntityMetadataPacket)
  AnimateEntity(packet: AnimateEntityPacket)
}

pub fn encode(packet: Packet) -> BytesTree {
  case packet {
    StatusResponse(packet) -> {
      bytes_tree.from_bit_array(<<0x00>>)
      |> encode_status_response(packet)
    }
    StatusPong(packet) -> {
      bytes_tree.from_bit_array(<<0x01>>)
      |> encode_status_pong(packet)
    }
    LoginSuccess(packet) -> {
      bytes_tree.from_bit_array(<<0x02>>)
      |> encode_login_success(packet)
    }
    Plugin(packet) -> {
      bytes_tree.from_bit_array(<<0x01>>)
      |> encode_plugin(packet)
    }
    Registry(packet) -> {
      bytes_tree.from_bit_array(<<0x07>>)
      |> encode_registry(packet)
    }
    FeatureFlags(packet) -> {
      bytes_tree.from_bit_array(<<0x0C>>)
      |> encode_feature_flags(packet)
    }
    KnownDataPacks(packet) -> {
      bytes_tree.from_bit_array(<<0x0E>>)
      |> encode_known_data_packs(packet)
    }
    FinishConfiguration -> bytes_tree.from_bit_array(<<0x03>>)
    Login(packet) -> {
      bytes_tree.from_bit_array(<<0x2B>>)
      |> encode_login(packet)
    }
    ChangeDifficulty(packet) -> {
      bytes_tree.from_bit_array(<<0x0B>>)
      |> encode_change_difficulty(packet)
    }
    GameEvent(packet) -> {
      bytes_tree.from_bit_array(<<0x22>>)
      |> encode_game_event(packet)
    }
    SetCenterChunk(packet) -> {
      bytes_tree.from_bit_array(<<0x54>>)
      |> encode_set_center_chunk(packet)
    }
    LevelChunkWithLight(packet) -> {
      bytes_tree.from_bit_array(<<0x27>>)
      |> encode_level_chunk_with_light(packet)
    }
    PlayerInfoRemove(packet) -> {
      bytes_tree.from_bit_array(<<0x3D>>)
      |> encode_player_info_remove(packet)
    }
    PlayerInfoUpdate(packet) -> {
      bytes_tree.from_bit_array(<<0x3E>>)
      |> encode_player_info_update(packet)
    }
    SynchronizePlayerPosition(packet) -> {
      bytes_tree.from_bit_array(<<0x40>>)
      |> encode_synchronize_player_position(packet)
    }
    SpawnEntity(packet) -> {
      bytes_tree.from_bit_array(<<0x01>>)
      |> encode_spawn_entity(packet)
    }
    UpdateEntityPosition(packet) -> {
      bytes_tree.from_bit_array(<<0x2E>>)
      |> encode_update_entity_position(packet)
    }
    UpdateEntityRotation(packet) -> {
      bytes_tree.from_bit_array(<<0x30>>)
      |> encode_update_entity_rotation(packet)
    }
    SetHeadRotation(packet) -> {
      bytes_tree.from_bit_array(<<0x48>>)
      |> encode_set_head_rotation(packet)
    }
    RemoveEntities(packet) -> {
      bytes_tree.from_bit_array(<<0x42>>)
      |> encode_remove_entities(packet)
    }
    PlayKeepAlive(packet) -> {
      bytes_tree.from_bit_array(<<0x26>>)
      |> encode_play_keep_alive(packet)
    }
    SetEntityMetadata(packet) -> {
      bytes_tree.from_bit_array(<<0x58>>)
      |> encode_set_entity_metadata(packet)
    }
    AnimateEntity(packet) -> {
      bytes_tree.from_bit_array(<<0x03>>)
      |> encode_animate_entity(packet)
    }
  }
}

pub type StatusResponsePacket {
  StatusResponsePacket(
    version_name: String,
    version_protocol: Int,
    max_player_count: Int,
    online_player_count: Int,
    players: List(#(String, String)),
    description: String,
    favicon: String,
    enforces_secure_chat: Bool,
  )
}

fn encode_status_response(tree: BytesTree, packet: StatusResponsePacket) {
  json.object([
    #(
      "version",
      json.object([
        #("name", json.string(packet.version_name)),
        #("protocol", json.int(packet.version_protocol)),
      ]),
    ),
    #(
      "players",
      json.object([
        #("max", json.int(packet.max_player_count)),
        #("online", json.int(packet.online_player_count)),
        #(
          "sample",
          json.array(
            list.map(packet.players, fn(player) {
              [#("name", json.string(player.0)), #("id", json.string(player.1))]
            }),
            of: json.object,
          ),
        ),
      ]),
    ),
    #("description", json.object([#("text", json.string(packet.description))])),
    #("favicon", json.string(packet.favicon)),
    #("enforcesSecureChat", json.bool(packet.enforces_secure_chat)),
  ])
  |> json.to_string
  |> encoder.string(tree, _)
}

pub type StatusPongPacket {
  StatusPongPacket(id: Int)
}

fn encode_status_pong(tree: BytesTree, packet: StatusPongPacket) {
  encoder.long(tree, packet.id)
}

pub type LoginSuccessPacket {
  LoginSuccessPacket(
    uuid: uuid.Uuid,
    username: String,
    properties: List(profile.ProfileProperty),
    strict_error_handling: Bool,
  )
}

fn encode_login_success(tree: BytesTree, packet: LoginSuccessPacket) {
  tree
  |> common.encode_uuid(packet.uuid)
  |> encoder.string(packet.username)
  |> encoder.array(packet.properties, profile.encode_property)
  |> encoder.bool(packet.strict_error_handling)
}

pub type PluginPacket {
  PluginPacket(channel: identifier.Identifier, implementation: BitArray)
}

pub fn encode_plugin(tree: BytesTree, packet: PluginPacket) {
  tree
  |> common.encode_identifier(packet.channel)
  |> encoder.raw(packet.implementation)
}

pub type FeatureFlagsPacket {
  FeatureFlagsPacket(flags: List(identifier.Identifier))
}

fn encode_feature_flags(tree: BytesTree, packet: FeatureFlagsPacket) {
  encoder.array(tree, packet.flags, common.encode_identifier)
}

pub type KnownDataPacksPacket {
  KnownDataPacksPacket(data_packs: List(KnownDataPack))
}

pub fn encode_known_data_packs(tree: BytesTree, packet: KnownDataPacksPacket) {
  encoder.array(tree, packet.data_packs, encode_known_data_pack)
}

pub type KnownDataPack {
  KnownDataPack(namespace: String, id: String, version: String)
}

fn encode_known_data_pack(tree: BytesTree, packet: KnownDataPack) {
  tree
  |> encoder.string(packet.namespace)
  |> encoder.string(packet.id)
  |> encoder.string(packet.version)
}

pub type RegistryPacket {
  RegistryPacket(id: identifier.Identifier, entries: List(RegistryEntry))
}

fn encode_registry(tree: BytesTree, packet: RegistryPacket) {
  tree
  |> common.encode_identifier(packet.id)
  |> encoder.array(packet.entries, encode_registry_entry)
}

pub type RegistryEntry {
  RegistryEntry(id: identifier.Identifier, data: Option(BitArray))
}

fn encode_registry_entry(tree: BytesTree, entry: RegistryEntry) {
  tree
  |> common.encode_identifier(entry.id)
  |> encoder.optional(entry.data, encoder.raw)
}

pub type LoginPacket {
  LoginPacket(
    entity_id: Int,
    is_hardcore: Bool,
    dimensions: List(identifier.Identifier),
    max_player_count: Int,
    view_distance: Int,
    simulation_distance: Int,
    reduced_debug_info: Bool,
    enable_respawn_screen: Bool,
    do_limited_crafting: Bool,
    dimension_id: Int,
    dimension_name: identifier.Identifier,
    hashed_seed: Int,
    game_mode: Int,
    previous_game_mode: Int,
    is_debug: Bool,
    is_flat: Bool,
    death_location: Option(DeathLocation),
    portal_cooldown: Int,
    enforce_secure_chat: Bool,
  )
}

pub const default_login = LoginPacket(
  entity_id: 0,
  is_hardcore: False,
  dimensions: [#("minecraft", "overworld")],
  max_player_count: constants.mc_max_player_count,
  view_distance: constants.mc_view_distance,
  simulation_distance: constants.mc_simulation_distance,
  reduced_debug_info: False,
  enable_respawn_screen: False,
  do_limited_crafting: False,
  dimension_id: 0,
  dimension_name: #("minecraft", "overworld"),
  hashed_seed: 0,
  game_mode: 0,
  previous_game_mode: -1,
  is_debug: False,
  is_flat: False,
  death_location: None,
  portal_cooldown: 0,
  enforce_secure_chat: False,
)

pub fn encode_login(tree: BytesTree, packet: LoginPacket) {
  tree
  |> encoder.int(packet.entity_id)
  |> encoder.bool(packet.is_hardcore)
  |> encoder.array(packet.dimensions, common.encode_identifier)
  |> encoder.var_int(packet.max_player_count)
  |> encoder.var_int(packet.view_distance)
  |> encoder.var_int(packet.simulation_distance)
  |> encoder.bool(packet.reduced_debug_info)
  |> encoder.bool(packet.enable_respawn_screen)
  |> encoder.bool(packet.do_limited_crafting)
  |> encoder.var_int(packet.dimension_id)
  |> common.encode_identifier(packet.dimension_name)
  |> encoder.long(packet.hashed_seed)
  |> encoder.byte(packet.game_mode)
  |> encoder.byte(packet.previous_game_mode)
  |> encoder.bool(packet.is_debug)
  |> encoder.bool(packet.is_flat)
  |> encoder.optional(packet.death_location, encode_death_location)
  |> encoder.var_int(packet.portal_cooldown)
  |> encoder.bool(packet.enforce_secure_chat)
}

pub type DeathLocation {
  DeathLocation(dimension: identifier.Identifier, position: Vector3(Float))
}

fn encode_death_location(tree: BytesTree, death_location: DeathLocation) {
  tree
  |> common.encode_identifier(death_location.dimension)
  |> encoder.position(death_location.position |> vector3.truncate)
}

pub type ChangeDifficultyPacket {
  ChangeDifficultyPacket(difficulty: Difficulty, locked: Bool)
}

fn encode_change_difficulty(tree: BytesTree, packet: ChangeDifficultyPacket) {
  tree
  |> encoder.byte(packet.difficulty |> difficulty.to_int)
  |> encoder.bool(packet.locked)
}

pub type GameEventPacket {
  GameEventPacket(game_event: game_event.GameEvent)
}

fn encode_game_event(tree: BytesTree, packet: GameEventPacket) {
  game_event.encode(tree, packet.game_event)
}

pub type SetCenterChunkPacket {
  SetCenterChunkPacket(x: Int, y: Int)
}

fn encode_set_center_chunk(tree: BytesTree, packet: SetCenterChunkPacket) {
  tree
  |> encoder.var_int(packet.x)
  |> encoder.var_int(packet.y)
}

pub type LevelChunkWithLightPacket {
  LevelChunkWithLightPacket(
    x: Int,
    z: Int,
    height_maps: BitArray,
    sections: List(chunk.ChunkSection),
    block_entities: List(Nil),
    sky_light_mask: List(Int),
    block_light_mask: List(Int),
    empty_sky_light_mask: List(Int),
    empty_block_light_mask: List(Int),
    sky_light_arrays: List(BitArray),
    block_light_arrays: List(BitArray),
  )
}

pub fn default_level_chunk_with_light_packet() {
  LevelChunkWithLightPacket(
    x: 0,
    z: 0,
    height_maps: <<0x0A, 0x00>>,
    sections: chunk.default_chunk(),
    block_entities: [],
    sky_light_mask: [],
    block_light_mask: [],
    empty_sky_light_mask: [],
    empty_block_light_mask: [],
    sky_light_arrays: [],
    block_light_arrays: [],
  )
}

pub fn default_level_chunk_with_light() {
  LevelChunkWithLight(default_level_chunk_with_light_packet())
}

fn encode_level_chunk_with_light(
  tree: BytesTree,
  packet: LevelChunkWithLightPacket,
) {
  let header =
    bytes_tree.new()
    |> encoder.int(packet.x)
    |> encoder.int(packet.z)
    |> encoder.raw(packet.height_maps)
  let data =
    bytes_tree.new()
    |> encoder.raw_array(packet.sections, chunk.encode_section)
  let data_size =
    bytes_tree.new()
    |> encoder.var_int(bytes_tree.byte_size(data))
  let footer =
    bytes_tree.new()
    |> encoder.array(packet.block_entities, fn(_, _) {
      todo as "Encode block entities"
    })
    |> encoder.array(packet.sky_light_mask, fn(_, _) {
      todo as "Encode sky light mask"
    })
    |> encoder.array(packet.block_light_mask, fn(_, _) {
      todo as "Encode block light mask"
    })
    |> encoder.array(packet.empty_sky_light_mask, fn(_, _) {
      todo as "Encode empty sky light mask"
    })
    |> encoder.array(packet.empty_block_light_mask, fn(_, _) {
      todo as "Encode empty block light mask"
    })
    |> encoder.array(packet.sky_light_arrays, encoder.byte_array)
    |> encoder.array(packet.block_light_arrays, encoder.byte_array)
  bytes_tree.concat([tree, header, data_size, data, footer])
}

pub type SynchronizePlayerPositionPacket {
  SynchronizePlayerPositionPacket(
    position: Vector3(Float),
    rotation: Rotation,
    flags: Int,
    teleport_id: Int,
  )
}

pub fn encode_synchronize_player_position(
  tree: BytesTree,
  packet: SynchronizePlayerPositionPacket,
) {
  tree
  |> encoder.double(packet.position.x)
  |> encoder.double(packet.position.y)
  |> encoder.double(packet.position.z)
  |> encoder.float(packet.rotation.yaw)
  |> encoder.float(packet.rotation.pitch)
  |> encoder.byte(packet.flags)
  |> encoder.var_int(packet.teleport_id)
}

pub type PlayerInfoRemovePacket {
  PlayerInfoRemovePacket(uuids: List(uuid.Uuid))
}

fn encode_player_info_remove(tree: BytesTree, packet: PlayerInfoRemovePacket) {
  encoder.array(tree, packet.uuids, common.encode_uuid)
}

// This packet could use some help. I based it's implementation off of Mojang's.
// I'm just not sure of a better type safe way to go about this. And the encoding gets really nasty.
pub type PlayerInfoUpdatePacket {
  PlayerInfoUpdatePacket(
    actions: set.Set(PlayerInfoUpdateAction),
    entries: List(PlayerInfoUpdateEntry),
  )
}

pub fn encode_player_info_update(
  tree: BytesTree,
  packet: PlayerInfoUpdatePacket,
) {
  tree
  |> encoder.byte(get_player_info_update_action_bit_field(packet.actions))
  |> encoder.array(packet.entries, fn(tree, entry) {
    encode_player_info_update_entry(tree, entry, packet.actions)
  })
}

pub type PlayerInfoUpdateAction {
  AddPlayer
  InitializeChat
  UpdateGameMode
  UpdateListed
  UpdateLatency
  UpdateDisplayName
}

fn get_player_info_update_action_bit_field(
  actions: set.Set(PlayerInfoUpdateAction),
) {
  set.fold(actions, 0, fn(bit_field, action) {
    int.bitwise_or(bit_field, get_player_info_update_action_bit(action))
  })
}

fn get_player_info_update_action_bit(action: PlayerInfoUpdateAction) {
  case action {
    AddPlayer -> 0b00000001
    InitializeChat -> 0b00000010
    UpdateGameMode -> 0b00000100
    UpdateListed -> 0b00001000
    UpdateLatency -> 0b00010000
    UpdateDisplayName -> 0b00100000
  }
}

pub type PlayerInfoUpdateEntry {
  PlayerInfoUpdateEntry(
    uuid: uuid.Uuid,
    name: String,
    latency: Int,
    visible_on_player_list: Bool,
    profile: profile.Profile,
    game_mode: player_game_mode.PlayerGameMode,
    chat_session: Option(chat_session.ChatSession),
    display_name: Option(String),
  )
}

// I need to find some pattern that's better than utilizing `set.contains`
// I'll come back to this hopefully with some fresh inspiration.
fn encode_player_info_update_entry(
  tree: BytesTree,
  entry: PlayerInfoUpdateEntry,
  actions: set.Set(PlayerInfoUpdateAction),
) {
  let tree = common.encode_uuid(tree, entry.uuid)
  let tree = case set.contains(actions, AddPlayer) {
    True -> {
      tree
      |> encoder.string(entry.name)
      |> encoder.array(entry.profile.properties, profile.encode_property)
    }
    False -> tree
  }
  let tree = case set.contains(actions, InitializeChat) {
    True -> encoder.optional(tree, entry.chat_session, chat_session.encode)
    False -> tree
  }
  let tree = case set.contains(actions, UpdateGameMode) {
    True -> encoder.var_int(tree, player_game_mode.to_int(entry.game_mode))
    False -> tree
  }
  let tree = case set.contains(actions, UpdateListed) {
    True -> encoder.bool(tree, entry.visible_on_player_list)
    False -> tree
  }
  let tree = case set.contains(actions, UpdateLatency) {
    True -> encoder.var_int(tree, entry.latency)
    False -> tree
  }
  case set.contains(actions, UpdateDisplayName) {
    True -> encoder.optional(tree, entry.display_name, encoder.string)
    False -> tree
  }
}

pub type SpawnEntityPacket {
  SpawnEntityPacket(
    id: Int,
    uuid: uuid.Uuid,
    entity_type: entity_kind.EntityKind,
    position: Vector3(Float),
    rotation: Rotation,
    head_rotation: Float,
    velocity: Vector3(Float),
  )
}

fn encode_spawn_entity(tree: BytesTree, packet: SpawnEntityPacket) {
  tree
  |> encoder.var_int(packet.id)
  |> common.encode_uuid(packet.uuid)
  |> encoder.var_int(packet.entity_type |> entity_kind.to_id)
  |> vector3.fold(packet.position, _, encoder.double)
  |> encoder.angle(packet.rotation.pitch)
  |> encoder.angle(packet.rotation.yaw)
  |> encoder.angle(packet.head_rotation)
  // TODO: Add support for entity data
  // Documentation can be found here: https://wiki.vg/Object_Data
  // I probably want to attach this to the entity type.
  |> encoder.var_int(0)
  |> common.encode_velocity(packet.velocity)
}

pub type UpdateEntityPositionPacket {
  UpdateEntityPositionPacket(id: Int, delta: Vector3(Float), is_grounded: Bool)
}

fn encode_update_entity_position(
  tree: BytesTree,
  packet: UpdateEntityPositionPacket,
) {
  tree
  |> encoder.var_int(packet.id)
  |> common.encode_delta(packet.delta)
  |> encoder.bool(packet.is_grounded)
}

pub type UpdateEntityRotationPacket {
  UpdateEntityRotationPacket(
    id: Int,
    yaw: Float,
    pitch: Float,
    is_grounded: Bool,
  )
}

fn encode_update_entity_rotation(
  tree: BytesTree,
  packet: UpdateEntityRotationPacket,
) {
  tree
  |> encoder.var_int(packet.id)
  |> encoder.angle(packet.yaw)
  |> encoder.angle(packet.pitch)
  |> encoder.bool(packet.is_grounded)
}

pub type SetHeadRotationPacket {
  SetHeadRotationPacket(id: Int, head_yaw: Float)
}

fn encode_set_head_rotation(tree: BytesTree, packet: SetHeadRotationPacket) {
  tree
  |> encoder.var_int(packet.id)
  |> encoder.angle(packet.head_yaw)
}

pub type RemoveEntitiesPacket {
  RemoveEntitiesPacket(entity_ids: List(Int))
}

fn encode_remove_entities(tree: BytesTree, packet: RemoveEntitiesPacket) {
  encoder.array(tree, packet.entity_ids, encoder.var_int)
}

pub type PlayKeepAlivePacket {
  PlayKeepAlivePacket(id: Int)
}

fn encode_play_keep_alive(tree: BytesTree, packet: PlayKeepAlivePacket) {
  encoder.long(tree, packet.id)
}

// An exteremly simplified version of entity metadata.
pub type SetEntityMetadataPacket {
  SetEntityMetadataPacket(entity_id: Int, metadata: entity_metadata.Metadata)
}

fn encode_set_entity_metadata(tree: BytesTree, packet: SetEntityMetadataPacket) {
  encoder.var_int(tree, packet.entity_id)
  |> entity_metadata.encode(packet.metadata)
}

pub type AnimateEntityPacket {
  AnimateEntityPacket(
    entity_id: Int,
    animation: entity_animation.EntityAnimation,
  )
}

pub fn encode_animate_entity(tree: BytesTree, packet: AnimateEntityPacket) {
  tree
  |> encoder.var_int(packet.entity_id)
  |> encoder.byte(entity_animation.to_int(packet.animation))
}
