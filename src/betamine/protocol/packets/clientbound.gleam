import betamine/common/chunk
import betamine/common/difficulty.{type Difficulty}
import betamine/common/entity_type
import betamine/common/game_mode
import betamine/common/profile
import betamine/common/rotation.{type Rotation}
import betamine/common/vector3.{type Vector3}
import betamine/constants
import betamine/protocol/common
import betamine/protocol/common/chat_session
import betamine/protocol/common/game_event
import betamine/protocol/encoder
import gleam/bytes_builder.{type BytesBuilder}
import gleam/int
import gleam/io
import gleam/json
import gleam/list
import gleam/option.{type Option, None}
import gleam/set

pub type Packet {
  StatusResponse(StatusResponsePacket)
  StatusPong(StatusPongPacket)
  LoginSuccess(LoginSuccessPacket)
  Plugin(PluginPacket)
  FeatureFlags(FeatureFlagsPacket)
  KnownDataPacks(KnownDataPacksPacket)
  Registry(RegistryPacket)
  FinishConfiguration
  Login(LoginPacket)
  ChangeDifficulty(ChangeDifficultyPacket)
  GameEvent(GameEventPacket)
  SetCenterChunk(SetCenterChunkPacket)
  LevelChunkWithLight(LevelChunkWithLightPacket)
  PlayerInfoRemove(PlayerInfoRemovePacket)
  PlayerInfoUpdate(PlayerInfoUpdatePacket)
  SynchronizePlayerPosition(SynchronizePlayerPositionPacket)
  SpawnEntity(SpawnEntityPacket)
  UpdateEntityPosition(UpdateEntityPositionPacket)
  UpdateEntityRotation(UpdateEntityRotationPacket)
  SetHeadRotation(SetHeadRotationPacket)
  RemoveEntities(RemoveEntitiesPacket)
  PlayKeepAlive(PlayKeepAlivePacket)
}

pub fn encode(packet: Packet) -> BytesBuilder {
  case packet {
    StatusResponse(packet) -> {
      bytes_builder.from_bit_array(<<0x00>>)
      |> encode_status_response(packet)
    }
    StatusPong(packet) -> {
      bytes_builder.from_bit_array(<<0x01>>)
      |> encode_status_pong(packet)
    }
    LoginSuccess(packet) -> {
      bytes_builder.from_bit_array(<<0x02>>)
      |> encode_login_success(packet)
    }
    Plugin(packet) -> {
      bytes_builder.from_bit_array(<<0x01>>)
      |> encode_plugin(packet)
    }
    Registry(packet) -> {
      bytes_builder.from_bit_array(<<0x07>>)
      |> encode_registry(packet)
    }
    FeatureFlags(packet) -> {
      bytes_builder.from_bit_array(<<0x0C>>)
      |> encode_feature_flags(packet)
    }
    KnownDataPacks(packet) -> {
      bytes_builder.from_bit_array(<<0x0E>>)
      |> encode_known_data_packs(packet)
    }
    FinishConfiguration -> bytes_builder.from_bit_array(<<0x03>>)
    Login(packet) -> {
      bytes_builder.from_bit_array(<<0x2B>>)
      |> encode_login(packet)
    }
    ChangeDifficulty(packet) -> {
      bytes_builder.from_bit_array(<<0x0B>>)
      |> encode_change_difficulty(packet)
    }
    GameEvent(packet) -> {
      bytes_builder.from_bit_array(<<0x22>>)
      |> encode_game_event(packet)
    }
    SetCenterChunk(packet) -> {
      bytes_builder.from_bit_array(<<0x54>>)
      |> encode_set_center_chunk(packet)
    }
    LevelChunkWithLight(packet) -> {
      bytes_builder.from_bit_array(<<0x27>>)
      |> encode_level_chunk_with_light(packet)
    }
    PlayerInfoRemove(packet) -> {
      bytes_builder.from_bit_array(<<0x3D>>)
      |> encode_player_info_remove(packet)
    }
    PlayerInfoUpdate(packet) -> {
      bytes_builder.from_bit_array(<<0x3E>>)
      |> encode_player_info_update(packet)
    }
    SynchronizePlayerPosition(packet) -> {
      bytes_builder.from_bit_array(<<0x40>>)
      |> encode_synchronize_player_position(packet)
    }
    SpawnEntity(packet) -> {
      bytes_builder.from_bit_array(<<0x01>>)
      |> encode_spawn_entity(packet)
    }
    UpdateEntityPosition(packet) -> {
      bytes_builder.from_bit_array(<<0x2E>>)
      |> encode_update_entity_position(packet)
    }
    UpdateEntityRotation(packet) -> {
      bytes_builder.from_bit_array(<<0x30>>)
      |> encode_update_entity_rotation(packet)
    }
    SetHeadRotation(packet) -> {
      bytes_builder.from_bit_array(<<0x48>>)
      |> encode_set_head_rotation(packet)
    }
    RemoveEntities(packet) -> {
      bytes_builder.from_bit_array(<<0x42>>)
      |> encode_remove_entities(packet)
    }
    PlayKeepAlive(packet) -> {
      bytes_builder.from_bit_array(<<0x26>>)
      |> encode_play_keep_alive(packet)
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

fn encode_status_response(builder: BytesBuilder, packet: StatusResponsePacket) {
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
  |> encoder.string(builder, _)
}

pub type StatusPongPacket {
  StatusPongPacket(id: Int)
}

fn encode_status_pong(builder: BytesBuilder, packet: StatusPongPacket) {
  encoder.long(builder, packet.id)
}

pub type LoginSuccessPacket {
  LoginSuccessPacket(
    uuid: Int,
    username: String,
    properties: List(profile.ProfileProperty),
    strict_error_handling: Bool,
  )
}

fn encode_login_success(builder: BytesBuilder, packet: LoginSuccessPacket) {
  builder
  |> encoder.uuid(packet.uuid)
  |> encoder.string(packet.username)
  |> encoder.array(packet.properties, profile.encode_profile_property)
  |> encoder.bool(packet.strict_error_handling)
}

pub type PluginPacket {
  PluginPacket(channel: Identifier, implementation: BitArray)
}

pub fn encode_plugin(builder: BytesBuilder, packet: PluginPacket) {
  builder
  |> encoder.identifier(packet.channel)
  |> encoder.raw(packet.implementation)
}

pub type Identifier =
  #(String, String)

pub type FeatureFlagsPacket {
  FeatureFlagsPacket(flags: List(Identifier))
}

fn encode_feature_flags(builder: BytesBuilder, packet: FeatureFlagsPacket) {
  encoder.array(builder, packet.flags, encoder.identifier)
}

pub type KnownDataPacksPacket {
  KnownDataPacksPacket(data_packs: List(KnownDataPack))
}

pub fn encode_known_data_packs(
  builder: BytesBuilder,
  packet: KnownDataPacksPacket,
) {
  encoder.array(builder, packet.data_packs, encode_known_data_pack)
}

pub type KnownDataPack {
  KnownDataPack(namespace: String, id: String, version: String)
}

fn encode_known_data_pack(builder: BytesBuilder, packet: KnownDataPack) {
  builder
  |> encoder.string(packet.namespace)
  |> encoder.string(packet.id)
  |> encoder.string(packet.version)
}

pub type RegistryPacket {
  RegistryPacket(id: Identifier, entries: List(RegistryEntry))
}

fn encode_registry(builder: BytesBuilder, packet: RegistryPacket) {
  builder
  |> encoder.identifier(packet.id)
  |> encoder.array(packet.entries, encode_registry_entry)
}

pub type RegistryEntry {
  RegistryEntry(id: Identifier, data: Option(BitArray))
}

fn encode_registry_entry(builder: BytesBuilder, entry: RegistryEntry) {
  builder
  |> encoder.identifier(entry.id)
  |> encoder.optional(entry.data, encoder.raw)
}

pub type LoginPacket {
  LoginPacket(
    entity_id: Int,
    is_hardcore: Bool,
    dimensions: List(Identifier),
    max_player_count: Int,
    view_distance: Int,
    simulation_distance: Int,
    reduced_debug_info: Bool,
    enable_respawn_screen: Bool,
    do_limited_crafting: Bool,
    dimension_id: Int,
    dimension_name: Identifier,
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

pub fn encode_login(builder: BytesBuilder, packet: LoginPacket) {
  builder
  |> encoder.int(packet.entity_id)
  |> encoder.bool(packet.is_hardcore)
  |> encoder.array(packet.dimensions, encoder.identifier)
  |> encoder.var_int(packet.max_player_count)
  |> encoder.var_int(packet.view_distance)
  |> encoder.var_int(packet.simulation_distance)
  |> encoder.bool(packet.reduced_debug_info)
  |> encoder.bool(packet.enable_respawn_screen)
  |> encoder.bool(packet.do_limited_crafting)
  |> encoder.var_int(packet.dimension_id)
  |> encoder.identifier(packet.dimension_name)
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
  DeathLocation(dimension: Identifier, position: Vector3(Float))
}

fn encode_death_location(builder: BytesBuilder, death_location: DeathLocation) {
  builder
  |> encoder.identifier(death_location.dimension)
  |> encoder.position(death_location.position)
}

pub type ChangeDifficultyPacket {
  ChangeDifficultyPacket(difficulty: Difficulty, locked: Bool)
}

fn encode_change_difficulty(
  builder: BytesBuilder,
  packet: ChangeDifficultyPacket,
) {
  builder
  |> encoder.byte(packet.difficulty |> difficulty.to_int)
  |> encoder.bool(packet.locked)
}

pub type GameEventPacket {
  GameEventPacket(game_event: game_event.GameEvent)
}

fn encode_game_event(builder: BytesBuilder, packet: GameEventPacket) {
  game_event.encode(builder, packet.game_event)
}

pub type SetCenterChunkPacket {
  SetCenterChunkPacket(x: Int, y: Int)
}

fn encode_set_center_chunk(builder: BytesBuilder, packet: SetCenterChunkPacket) {
  builder
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

pub const default_level_chunk_with_light = LevelChunkWithLight(
  LevelChunkWithLightPacket(
    x: 0,
    z: 0,
    height_maps: <<0x0A, 0x00>>,
    sections: chunk.default_chunk,
    block_entities: [],
    sky_light_mask: [],
    block_light_mask: [],
    empty_sky_light_mask: [],
    empty_block_light_mask: [],
    sky_light_arrays: [],
    block_light_arrays: [],
  ),
)

fn encode_level_chunk_with_light(
  builder: BytesBuilder,
  packet: LevelChunkWithLightPacket,
) {
  let header =
    bytes_builder.new()
    |> encoder.int(packet.x)
    |> encoder.int(packet.z)
    |> encoder.raw(packet.height_maps)
  let data =
    bytes_builder.new()
    |> encoder.raw_array(packet.sections, chunk.encode_section)
  let data_size =
    bytes_builder.new()
    |> encoder.var_int(bytes_builder.byte_size(data))
  let footer =
    bytes_builder.new()
    |> encoder.array(packet.block_entities, fn(_, _) { todo })
    |> encoder.array(packet.sky_light_mask, fn(_, _) { todo })
    |> encoder.array(packet.block_light_mask, fn(_, _) { todo })
    |> encoder.array(packet.empty_sky_light_mask, fn(_, _) { todo })
    |> encoder.array(packet.empty_block_light_mask, fn(_, _) { todo })
    |> encoder.array(packet.sky_light_arrays, encoder.byte_array)
    |> encoder.array(packet.block_light_arrays, encoder.byte_array)
  bytes_builder.concat([builder, header, data_size, data, footer])
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
  builder: BytesBuilder,
  packet: SynchronizePlayerPositionPacket,
) {
  builder
  |> encoder.double(packet.position.x)
  |> encoder.double(packet.position.y)
  |> encoder.double(packet.position.z)
  |> encoder.float(packet.rotation.yaw)
  |> encoder.float(packet.rotation.pitch)
  |> encoder.byte(packet.flags)
  |> encoder.var_int(packet.teleport_id)
}

pub type PlayerInfoRemovePacket {
  PlayerInfoRemovePacket(uuids: List(Int))
}

fn encode_player_info_remove(
  builder: BytesBuilder,
  packet: PlayerInfoRemovePacket,
) {
  encoder.array(builder, packet.uuids, encoder.uuid)
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
  builder: BytesBuilder,
  packet: PlayerInfoUpdatePacket,
) {
  builder
  |> encoder.byte(get_player_info_update_action_bit_field(packet.actions))
  |> encoder.array(packet.entries, fn(builder, entry) {
    encode_player_info_update_entry(builder, entry, packet.actions)
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
    uuid: Int,
    name: String,
    latency: Int,
    visible_on_player_list: Bool,
    profile: profile.Profile,
    game_mode: game_mode.GameMode,
    chat_session: Option(chat_session.ChatSession),
    display_name: Option(String),
  )
}

// I need to find some pattern that's better than utilizing `set.contains`
// I'll come back to this hopefully with some fresh inspiration.
fn encode_player_info_update_entry(
  builder: BytesBuilder,
  entry: PlayerInfoUpdateEntry,
  actions: set.Set(PlayerInfoUpdateAction),
) {
  let builder = encoder.uuid(builder, entry.uuid)
  let builder = case set.contains(actions, AddPlayer) {
    True -> {
      builder
      |> encoder.string(entry.name)
      |> encoder.array(
        entry.profile.properties,
        profile.encode_profile_property,
      )
    }
    False -> builder
  }
  let builder = case set.contains(actions, InitializeChat) {
    True -> encoder.optional(builder, entry.chat_session, chat_session.encode)
    False -> builder
  }
  let builder = case set.contains(actions, UpdateGameMode) {
    True -> encoder.var_int(builder, game_mode.to_int(entry.game_mode))
    False -> builder
  }
  let builder = case set.contains(actions, UpdateListed) {
    True -> encoder.bool(builder, entry.visible_on_player_list)
    False -> builder
  }
  let builder = case set.contains(actions, UpdateLatency) {
    True -> encoder.var_int(builder, entry.latency)
    False -> builder
  }
  case set.contains(actions, UpdateDisplayName) {
    True -> encoder.optional(builder, entry.display_name, encoder.string)
    False -> builder
  }
}

pub type SpawnEntityPacket {
  SpawnEntityPacket(
    id: Int,
    uuid: Int,
    entity_type: entity_type.EntityType,
    position: Vector3(Float),
    rotation: Rotation,
    head_rotation: Float,
    velocity: Vector3(Float),
  )
}

fn encode_spawn_entity(builder: BytesBuilder, packet: SpawnEntityPacket) {
  builder
  |> encoder.var_int(packet.id)
  |> encoder.uuid(packet.uuid)
  |> encoder.var_int(packet.entity_type |> entity_type.to_id)
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
  builder: BytesBuilder,
  packet: UpdateEntityPositionPacket,
) {
  builder
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
  builder: BytesBuilder,
  packet: UpdateEntityRotationPacket,
) {
  builder
  |> encoder.var_int(packet.id)
  |> encoder.angle(packet.yaw)
  |> encoder.angle(packet.pitch)
  |> encoder.bool(packet.is_grounded)
}

pub type SetHeadRotationPacket {
  SetHeadRotationPacket(id: Int, head_yaw: Float)
}

fn encode_set_head_rotation(
  builder: BytesBuilder,
  packet: SetHeadRotationPacket,
) {
  builder
  |> encoder.var_int(packet.id)
  |> encoder.angle(packet.head_yaw)
}

pub type RemoveEntitiesPacket {
  RemoveEntitiesPacket(entity_ids: List(Int))
}

fn encode_remove_entities(builder: BytesBuilder, packet: RemoveEntitiesPacket) {
  encoder.array(builder, packet.entity_ids, encoder.var_int)
}

pub type PlayKeepAlivePacket {
  PlayKeepAlivePacket(id: Int)
}

fn encode_play_keep_alive(builder: BytesBuilder, packet: PlayKeepAlivePacket) {
  encoder.long(builder, packet.id)
}
