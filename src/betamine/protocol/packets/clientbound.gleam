import betamine/common/block/block_state
import betamine/common/chat/chat_session
import betamine/common/difficulty.{type Difficulty}
import betamine/common/entity/entity_animation
import betamine/common/entity/entity_kind
import betamine/common/entity/player/player_game_mode
import betamine/common/identifier
import betamine/common/position
import betamine/common/profile
import betamine/common/rotation.{type Rotation}
import betamine/common/uuid
import betamine/common/vector3.{type Vector3}
import betamine/constants
import betamine/protocol/common
import betamine/protocol/common/chunk
import betamine/protocol/common/entity/entity_metadata
import betamine/protocol/common/game_event
import betamine/protocol/encoder
import gleam/bytes_tree.{type BytesTree}
import gleam/function
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
  UpdateTags(packet: UpdateTagsPacket)
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
  AcknowledgeBlockChange(packet: AcknowledgeBlockChangePacket)
  BlockUpdate(packet: BlockUpdatePacket)
}

fn get_packet_id(packet: Packet) -> Int {
  case packet {
    StatusResponse(..) -> 0
    StatusPong(..) -> 1
    LoginSuccess(..) -> 2
    Plugin(..) -> 1
    Registry(..) -> 7
    FeatureFlags(..) -> 12
    UpdateTags(..) -> 13
    KnownDataPacks(..) -> 14
    FinishConfiguration -> 3
    Login(..) -> 48
    ChangeDifficulty(..) -> 10
    GameEvent(..) -> 38
    SetCenterChunk(..) -> 92
    LevelChunkWithLight(..) -> 44
    PlayerInfoRemove(..) -> 67
    PlayerInfoUpdate(..) -> 68
    SynchronizePlayerPosition(..) -> 70
    SpawnEntity(..) -> 1
    UpdateEntityPosition(..) -> 51
    UpdateEntityRotation(..) -> 54
    SetHeadRotation(..) -> 81
    RemoveEntities(..) -> 75
    PlayKeepAlive(..) -> 27
    SetEntityMetadata(..) -> 97
    AnimateEntity(..) -> 2
    AcknowledgeBlockChange(..) -> 4
    BlockUpdate(..) -> 8
  }
}

pub fn encode(packet: Packet) -> BytesTree {
  encoder.var_int(bytes_tree.new(), get_packet_id(packet))
  |> case packet {
    StatusResponse(packet) -> encode_status_response(_, packet)
    StatusPong(packet) -> encode_status_pong(_, packet)
    LoginSuccess(packet) -> encode_login_success(_, packet)
    Plugin(packet) -> encode_plugin(_, packet)
    Registry(packet) -> encode_registry(_, packet)
    FeatureFlags(packet) -> encode_feature_flags(_, packet)
    UpdateTags(packet) -> encode_update_tags(_, packet)
    KnownDataPacks(packet) -> encode_known_data_packs(_, packet)
    FinishConfiguration -> function.identity
    Login(packet) -> encode_login(_, packet)
    ChangeDifficulty(packet) -> encode_change_difficulty(_, packet)
    GameEvent(packet) -> encode_game_event(_, packet)
    SetCenterChunk(packet) -> encode_set_center_chunk(_, packet)
    LevelChunkWithLight(packet) -> encode_level_chunk_with_light(_, packet)
    PlayerInfoRemove(packet) -> encode_player_info_remove(_, packet)
    PlayerInfoUpdate(packet) -> encode_player_info_update(_, packet)
    SynchronizePlayerPosition(packet) -> encode_synchronize_player_position(
      _,
      packet,
    )
    SpawnEntity(packet) -> encode_spawn_entity(_, packet)
    UpdateEntityPosition(packet) -> encode_update_entity_position(_, packet)
    UpdateEntityRotation(packet) -> encode_update_entity_rotation(_, packet)
    SetHeadRotation(packet) -> encode_set_head_rotation(_, packet)
    RemoveEntities(packet) -> encode_remove_entities(_, packet)
    PlayKeepAlive(packet) -> encode_play_keep_alive(_, packet)
    SetEntityMetadata(packet) -> encode_set_entity_metadata(_, packet)
    AnimateEntity(packet) -> encode_animate_entity(_, packet)
    AcknowledgeBlockChange(packet) -> encode_acknowledge_block_change(_, packet)
    BlockUpdate(packet) -> encode_block_update(_, packet)
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
  LoginSuccessPacket(profile: profile.Profile)
}

fn encode_login_success(tree: BytesTree, packet: LoginSuccessPacket) {
  common.encode_profile(tree, packet.profile)
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

pub type UpdateTagsPacket {
  UpdateTagsPacket(
    registries: List(
      #(identifier.Identifier, List(#(identifier.Identifier, List(Int)))),
    ),
  )
}

fn encode_update_tags(tree: BytesTree, packet: UpdateTagsPacket) {
  encoder.array(tree, packet.registries, fn(tree, registry) {
    let #(registry_identifier, tags) = registry
    tree
    |> encoder.string(identifier.to_string(registry_identifier))
    |> encoder.array(tags, fn(tree, tag) {
      let #(identifier, values) = tag
      tree
      |> encoder.string(identifier.to_string(identifier))
      |> encoder.array(values, encoder.var_int)
    })
  })
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
    sea_level: Int,
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
  sea_level: 0,
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
  |> encoder.var_int(packet.sea_level)
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
    heightmaps: List(Nil),
    chunk: chunk.Chunk,
    block_entities: List(Nil),
    sky_light_mask: List(Int),
    block_light_mask: List(Int),
    empty_sky_light_mask: List(Int),
    empty_block_light_mask: List(Int),
    sky_light_arrays: List(List(Int)),
    block_light_arrays: List(List(Int)),
  )
}

pub fn default_level_chunk_with_light_packet() {
  let sky_light_array = list.range(1, 2048) |> list.map(fn(_) { 0xFF })
  let block_light_array = sky_light_array |> list.map(fn(_) { 0x0 })
  LevelChunkWithLightPacket(
    x: 0,
    z: 0,
    heightmaps: [],
    chunk: chunk.default(),
    block_entities: [],
    sky_light_mask: [0b11111111111111111111111111],
    block_light_mask: [],
    empty_sky_light_mask: [],
    empty_block_light_mask: [],
    sky_light_arrays: list.range(1, 26) |> list.map(fn(_) { sky_light_array }),
    block_light_arrays: list.range(1, 26)
      |> list.map(fn(_) { block_light_array }),
  )
}

pub fn default_level_chunk_with_light() {
  LevelChunkWithLight(default_level_chunk_with_light_packet())
}

fn encode_level_chunk_with_light(
  tree: BytesTree,
  packet: LevelChunkWithLightPacket,
) {
  tree
  |> encoder.int(packet.x)
  |> encoder.int(packet.z)
  |> encoder.array(packet.heightmaps, fn(_, _) { todo as "Encode heightmaps" })
  |> chunk.encode(packet.chunk)
  |> encoder.array(packet.block_entities, fn(_, _) {
    todo as "Encode block entities"
  })
  |> encoder.array(packet.sky_light_mask, encoder.long)
  |> encoder.array(packet.block_light_mask, encoder.long)
  |> encoder.array(packet.empty_sky_light_mask, encoder.long)
  |> encoder.array(packet.empty_block_light_mask, encoder.long)
  |> encoder.array(packet.sky_light_arrays, fn(tree, sky_light_array) {
    encoder.array(tree, sky_light_array, encoder.byte)
  })
  |> encoder.array(packet.block_light_arrays, fn(tree, sky_light_array) {
    encoder.array(tree, sky_light_array, encoder.byte)
  })
}

pub type SynchronizePlayerPositionPacket {
  SynchronizePlayerPositionPacket(
    teleport_id: Int,
    position: Vector3(Float),
    velocity: Vector3(Float),
    rotation: Rotation,
    flags: Int,
  )
}

pub fn encode_synchronize_player_position(
  tree: BytesTree,
  packet: SynchronizePlayerPositionPacket,
) {
  tree
  |> encoder.var_int(packet.teleport_id)
  |> common.encode_vector3(packet.position, encoder.double)
  |> common.encode_vector3(packet.velocity, encoder.double)
  |> encoder.float(packet.rotation.yaw)
  |> encoder.float(packet.rotation.pitch)
  |> encoder.int(packet.flags)
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
  let tree = case set.contains(actions, AddPlayer) {
    True -> common.encode_profile(tree, entry.profile)
    False -> common.encode_uuid(tree, entry.uuid)
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

pub type AcknowledgeBlockChangePacket {
  AcknowledgeBlockChangePacket(sequence: Int)
}

pub fn encode_acknowledge_block_change(
  tree: BytesTree,
  packet: AcknowledgeBlockChangePacket,
) {
  tree |> encoder.var_int(packet.sequence)
}

pub type BlockUpdatePacket {
  BlockUpdatePacket(
    position: position.Position,
    block_state: block_state.BlockState,
  )
}

pub fn encode_block_update(tree: BytesTree, packet: BlockUpdatePacket) {
  tree
  |> encoder.position(packet.position)
  |> encoder.block_state(packet.block_state)
}
