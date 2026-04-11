import betamine/client/protocol/decoder
import betamine/client/protocol/encoder
import betamine/client/protocol/error
import gleam/bytes_tree
import gleam/list
import gleam/result

pub type Serverbound {
  ServerboundAcceptTeleportation
  ServerboundBlockEntityTagQuery
  ServerboundBundleItemSelected
  ServerboundChangeDifficulty
  ServerboundChangeGameMode
  ServerboundChatAck
  ServerboundChatCommand
  ServerboundChatCommandSigned
  ServerboundChat
  ServerboundChatSessionUpdate
  ServerboundChunkBatchReceived
  ServerboundClientCommand
  ServerboundClientInformation
  ServerboundClientTickEnd
  ServerboundCommandSuggestion
  ServerboundConfigurationAcknowledged
  ServerboundContainerButtonClick
  ServerboundContainerClick
  ServerboundContainerClose
  ServerboundContainerSlotStateChanged
  ServerboundCookieResponse
  ServerboundCustomPayload
  ServerboundDebugSubscriptionRequest
  ServerboundEditBook
  ServerboundEntityTagQuery
  ServerboundInteract
  ServerboundJigsawGenerate
  ServerboundKeepAlive
  ServerboundLockDifficulty
  ServerboundMovePlayerPos
  ServerboundMovePlayerPosRot
  ServerboundMovePlayerRot
  ServerboundMovePlayerStatusOnly
  ServerboundMoveVehicle
  ServerboundPaddleBoat
  ServerboundPickItemFromBlock
  ServerboundPickItemFromEntity
  ServerboundPingRequest
  ServerboundPlaceRecipe
  ServerboundPlayerAbilities
  ServerboundPlayerAction
  ServerboundPlayerCommand
  ServerboundPlayerInput
  ServerboundPlayerLoaded
  ServerboundPong(id: Int)
  ServerboundRecipeBookChangeSettings
  ServerboundRecipeBookSeenRecipe
  ServerboundRenameItem
  ServerboundResourcePack
  ServerboundSeenAdvancements
  ServerboundSelectTrade
  ServerboundSetBeacon
  ServerboundSetCarriedItem
  ServerboundSetCommandBlock
  ServerboundSetCommandMinecart
  ServerboundSetCreativeModeSlot
  ServerboundSetJigsawBlock
  ServerboundSetStructureBlock
  ServerboundSetTestBlock
  ServerboundSignUpdate
  ServerboundSwing
  ServerboundTeleportToEntity
  ServerboundTestInstanceBlockAction
  ServerboundUseItemOn
  ServerboundUseItem
  ServerboundCustomClickAction
}

pub fn decode(
  id: Int,
  bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  case id {
    0 -> decode_accept_teleportation(bit_array)
    1 -> decode_block_entity_tag_query(bit_array)
    2 -> decode_bundle_item_selected(bit_array)
    3 -> decode_change_difficulty(bit_array)
    4 -> decode_change_game_mode(bit_array)
    5 -> decode_chat_ack(bit_array)
    6 -> decode_chat_command(bit_array)
    7 -> decode_chat_command_signed(bit_array)
    8 -> decode_chat(bit_array)
    9 -> decode_chat_session_update(bit_array)
    10 -> decode_chunk_batch_received(bit_array)
    11 -> decode_client_command(bit_array)
    13 -> decode_client_information(bit_array)
    12 -> decode_client_tick_end(bit_array)
    14 -> decode_command_suggestion(bit_array)
    15 -> decode_configuration_acknowledged(bit_array)
    16 -> decode_container_button_click(bit_array)
    17 -> decode_container_click(bit_array)
    18 -> decode_container_close(bit_array)
    19 -> decode_container_slot_state_changed(bit_array)
    20 -> decode_cookie_response(bit_array)
    21 -> decode_custom_payload(bit_array)
    22 -> decode_debug_subscription_request(bit_array)
    23 -> decode_edit_book(bit_array)
    24 -> decode_entity_tag_query(bit_array)
    25 -> decode_interact(bit_array)
    26 -> decode_jigsaw_generate(bit_array)
    27 -> decode_keep_alive(bit_array)
    28 -> decode_lock_difficulty(bit_array)
    29 -> decode_move_player_pos(bit_array)
    30 -> decode_move_player_pos_rot(bit_array)
    31 -> decode_move_player_rot(bit_array)
    32 -> decode_move_player_status_only(bit_array)
    33 -> decode_move_vehicle(bit_array)
    34 -> decode_paddle_boat(bit_array)
    35 -> decode_pick_item_from_block(bit_array)
    36 -> decode_pick_item_from_entity(bit_array)
    37 -> decode_ping_request(bit_array)
    38 -> decode_place_recipe(bit_array)
    39 -> decode_player_abilities(bit_array)
    40 -> decode_player_action(bit_array)
    41 -> decode_player_command(bit_array)
    42 -> decode_player_input(bit_array)
    43 -> decode_player_loaded(bit_array)
    44 -> decode_pong(bit_array)
    45 -> decode_recipe_book_change_settings(bit_array)
    46 -> decode_recipe_book_seen_recipe(bit_array)
    47 -> decode_rename_item(bit_array)
    48 -> decode_resource_pack(bit_array)
    49 -> decode_seen_advancements(bit_array)
    50 -> decode_select_trade(bit_array)
    51 -> decode_set_beacon(bit_array)
    52 -> decode_set_carried_item(bit_array)
    53 -> decode_set_command_block(bit_array)
    54 -> decode_set_command_minecart(bit_array)
    55 -> decode_set_creative_mode_slot(bit_array)
    56 -> decode_set_jigsaw_block(bit_array)
    57 -> decode_set_structure_block(bit_array)
    58 -> decode_set_test_block(bit_array)
    59 -> decode_sign_update(bit_array)
    60 -> decode_swing(bit_array)
    61 -> decode_teleport_to_entity(bit_array)
    62 -> decode_test_instance_block_action(bit_array)
    63 -> decode_use_item_on(bit_array)
    64 -> decode_use_item(bit_array)
    65 -> decode_custom_click_action(bit_array)
    _ -> Error(error.InvalidPacketId(id))
  }
}

fn decode_accept_teleportation(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundAcceptTeleportation)
}

fn decode_block_entity_tag_query(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundBlockEntityTagQuery)
}

fn decode_bundle_item_selected(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundBundleItemSelected)
}

fn decode_change_difficulty(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundChangeDifficulty)
}

fn decode_change_game_mode(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundChangeGameMode)
}

fn decode_chat_ack(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundChatAck)
}

fn decode_chat_command(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundChatCommand)
}

fn decode_chat_command_signed(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundChatCommandSigned)
}

fn decode_chat(_bit_array: BitArray) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundChat)
}

fn decode_chat_session_update(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundChatSessionUpdate)
}

fn decode_chunk_batch_received(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundChunkBatchReceived)
}

fn decode_client_command(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundClientCommand)
}

fn decode_client_information(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundClientInformation)
}

fn decode_client_tick_end(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundClientTickEnd)
}

fn decode_command_suggestion(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundCommandSuggestion)
}

fn decode_configuration_acknowledged(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundConfigurationAcknowledged)
}

fn decode_container_button_click(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundContainerButtonClick)
}

fn decode_container_click(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundContainerClick)
}

fn decode_container_close(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundContainerClose)
}

fn decode_container_slot_state_changed(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundContainerSlotStateChanged)
}

fn decode_cookie_response(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundCookieResponse)
}

fn decode_custom_payload(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundCustomPayload)
}

fn decode_debug_subscription_request(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundDebugSubscriptionRequest)
}

fn decode_edit_book(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundEditBook)
}

fn decode_entity_tag_query(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundEntityTagQuery)
}

fn decode_interact(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundInteract)
}

fn decode_jigsaw_generate(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundJigsawGenerate)
}

fn decode_keep_alive(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundKeepAlive)
}

fn decode_lock_difficulty(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundLockDifficulty)
}

fn decode_move_player_pos(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundMovePlayerPos)
}

fn decode_move_player_pos_rot(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundMovePlayerPosRot)
}

fn decode_move_player_rot(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundMovePlayerRot)
}

fn decode_move_player_status_only(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundMovePlayerStatusOnly)
}

fn decode_move_vehicle(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundMoveVehicle)
}

fn decode_paddle_boat(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundPaddleBoat)
}

fn decode_pick_item_from_block(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundPickItemFromBlock)
}

fn decode_pick_item_from_entity(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundPickItemFromEntity)
}

fn decode_ping_request(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundPingRequest)
}

fn decode_place_recipe(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundPlaceRecipe)
}

fn decode_player_abilities(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundPlayerAbilities)
}

fn decode_player_action(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundPlayerAction)
}

fn decode_player_command(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundPlayerCommand)
}

fn decode_player_input(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundPlayerInput)
}

fn decode_player_loaded(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundPlayerLoaded)
}

fn decode_pong(bit_array: BitArray) -> Result(Serverbound, error.DecodeError) {
  use #(id, _) <- result.try(decoder.int(bit_array))
  Ok(ServerboundPong(id:))
}

fn decode_recipe_book_change_settings(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundRecipeBookChangeSettings)
}

fn decode_recipe_book_seen_recipe(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundRecipeBookSeenRecipe)
}

fn decode_rename_item(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundRenameItem)
}

fn decode_resource_pack(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundResourcePack)
}

fn decode_seen_advancements(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundSeenAdvancements)
}

fn decode_select_trade(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundSelectTrade)
}

fn decode_set_beacon(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundSetBeacon)
}

fn decode_set_carried_item(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundSetCarriedItem)
}

fn decode_set_command_block(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundSetCommandBlock)
}

fn decode_set_command_minecart(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundSetCommandMinecart)
}

fn decode_set_creative_mode_slot(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundSetCreativeModeSlot)
}

fn decode_set_jigsaw_block(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundSetJigsawBlock)
}

fn decode_set_structure_block(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundSetStructureBlock)
}

fn decode_set_test_block(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundSetTestBlock)
}

fn decode_sign_update(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundSignUpdate)
}

fn decode_swing(_bit_array: BitArray) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundSwing)
}

fn decode_teleport_to_entity(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundTeleportToEntity)
}

fn decode_test_instance_block_action(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundTestInstanceBlockAction)
}

fn decode_use_item_on(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundUseItemOn)
}

fn decode_use_item(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundUseItem)
}

fn decode_custom_click_action(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundCustomClickAction)
}

pub type Clientbound {
  ClientboundBundleDelimiter
  ClientboundAddEntity
  ClientboundAnimate
  ClientboundAwardStats
  ClientboundBlockChangedAck
  ClientboundBlockDestruction
  ClientboundBlockEntityData
  ClientboundBlockEvent
  ClientboundBlockUpdate
  ClientboundBossEvent
  ClientboundChangeDifficulty
  ClientboundChunkBatchFinished
  ClientboundChunkBatchStart
  ClientboundChunksBiomes
  ClientboundClearTitles
  ClientboundCommandSuggestions
  ClientboundCommands
  ClientboundContainerClose
  ClientboundContainerSetContent
  ClientboundContainerSetData
  ClientboundContainerSetSlot
  ClientboundCookieRequest
  ClientboundCooldown
  ClientboundCustomChatCompletions
  ClientboundCustomPayload
  ClientboundDamageEvent
  ClientboundDebugBlockValue
  ClientboundDebugChunkValue
  ClientboundDebugEntityValue
  ClientboundDebugEvent
  ClientboundDebugSample
  ClientboundDeleteChat
  ClientboundDisconnect
  ClientboundDisguisedChat
  ClientboundEntityEvent
  ClientboundEntityPositionSync
  ClientboundExplode
  ClientboundForgetLevelChunk
  ClientboundGameEvent
  ClientboundGameTestHighlightPos
  ClientboundMountScreenOpen
  ClientboundHurtAnimation
  ClientboundInitializeBorder
  ClientboundKeepAlive(id: Int)
  ClientboundLevelChunkWithLight
  ClientboundLevelEvent
  ClientboundLevelParticles
  ClientboundLightUpdate
  ClientboundLogin
  ClientboundMapItemData
  ClientboundMerchantOffers
  ClientboundMoveEntityPos
  ClientboundMoveEntityPosRot
  ClientboundMoveMinecartAlongTrack
  ClientboundMoveEntityRot
  ClientboundMoveVehicle
  ClientboundOpenBook
  ClientboundOpenScreen
  ClientboundOpenSignEditor
  ClientboundPing(id: Int)
  ClientboundPongResponse
  ClientboundPlaceGhostRecipe
  ClientboundPlayerAbilities
  ClientboundPlayerChat
  ClientboundPlayerCombatEnd
  ClientboundPlayerCombatEnter
  ClientboundPlayerCombatKill
  ClientboundPlayerInfoRemove
  ClientboundPlayerInfoUpdate
  ClientboundPlayerLookAt
  ClientboundPlayerPosition
  ClientboundPlayerRotation
  ClientboundRecipeBookAdd
  ClientboundRecipeBookRemove
  ClientboundRecipeBookSettings
  ClientboundRemoveEntities
  ClientboundRemoveMobEffect
  ClientboundResetScore
  ClientboundResourcePackPop
  ClientboundResourcePackPush
  ClientboundRespawn
  ClientboundRotateHead
  ClientboundSectionBlocksUpdate
  ClientboundSelectAdvancementsTab
  ClientboundServerData
  ClientboundSetActionBarText
  ClientboundSetBorderCenter
  ClientboundSetBorderLerpSize
  ClientboundSetBorderSize
  ClientboundSetBorderWarningDelay
  ClientboundSetBorderWarningDistance
  ClientboundSetCamera
  ClientboundSetChunkCacheCenter
  ClientboundSetChunkCacheRadius
  ClientboundSetCursorItem
  ClientboundSetDefaultSpawnPosition
  ClientboundSetDisplayObjective
  ClientboundSetEntityData
  ClientboundSetEntityLink
  ClientboundSetEntityMotion
  ClientboundSetEquipment
  ClientboundSetExperience
  ClientboundSetHealth
  ClientboundSetHeldSlot
  ClientboundSetObjective
  ClientboundSetPassengers
  ClientboundSetPlayerInventory
  ClientboundSetPlayerTeam
  ClientboundSetScore
  ClientboundSetSimulationDistance
  ClientboundSetSubtitleText
  ClientboundSetTime
  ClientboundSetTitleText
  ClientboundSetTitlesAnimation
  ClientboundSoundEntity
  ClientboundSound
  ClientboundStartConfiguration
  ClientboundStopSound
  ClientboundStoreCookie
  ClientboundSystemChat
  ClientboundTabList
  ClientboundTagQuery
  ClientboundTakeItemEntity
  ClientboundTeleportEntity
  ClientboundTestInstanceBlockStatus
  ClientboundTickingState
  ClientboundTickingStep
  ClientboundTransfer
  ClientboundUpdateAdvancements
  ClientboundUpdateAttributes
  ClientboundUpdateMobEffect
  ClientboundUpdateRecipes
  ClientboundUpdateTags
  ClientboundProjectilePower
  ClientboundCustomReportDetails
  ClientboundServerLinks
  ClientboundWaypoint
  ClientboundClearDialog
  ClientboundShowDialog
}

pub fn clientbound_packet_id(packet: Clientbound) -> Int {
  case packet {
    ClientboundBundleDelimiter(..) -> 0
    ClientboundAddEntity(..) -> 1
    ClientboundAnimate(..) -> 2
    ClientboundAwardStats(..) -> 3
    ClientboundBlockChangedAck(..) -> 4
    ClientboundBlockDestruction(..) -> 5
    ClientboundBlockEntityData(..) -> 6
    ClientboundBlockEvent(..) -> 7
    ClientboundBlockUpdate(..) -> 8
    ClientboundBossEvent(..) -> 9
    ClientboundChangeDifficulty(..) -> 10
    ClientboundChunkBatchFinished(..) -> 11
    ClientboundChunkBatchStart(..) -> 12
    ClientboundChunksBiomes(..) -> 13
    ClientboundClearTitles(..) -> 14
    ClientboundCommandSuggestions(..) -> 15
    ClientboundCommands(..) -> 16
    ClientboundContainerClose(..) -> 17
    ClientboundContainerSetContent(..) -> 18
    ClientboundContainerSetData(..) -> 19
    ClientboundContainerSetSlot(..) -> 20
    ClientboundCookieRequest(..) -> 21
    ClientboundCooldown(..) -> 22
    ClientboundCustomChatCompletions(..) -> 23
    ClientboundCustomPayload(..) -> 24
    ClientboundDamageEvent(..) -> 25
    ClientboundDebugBlockValue(..) -> 26
    ClientboundDebugChunkValue(..) -> 27
    ClientboundDebugEntityValue(..) -> 28
    ClientboundDebugEvent(..) -> 29
    ClientboundDebugSample(..) -> 30
    ClientboundDeleteChat(..) -> 31
    ClientboundDisconnect(..) -> 32
    ClientboundDisguisedChat(..) -> 33
    ClientboundEntityEvent(..) -> 34
    ClientboundEntityPositionSync(..) -> 35
    ClientboundExplode(..) -> 36
    ClientboundForgetLevelChunk(..) -> 37
    ClientboundGameEvent(..) -> 38
    ClientboundGameTestHighlightPos(..) -> 39
    ClientboundMountScreenOpen(..) -> 40
    ClientboundHurtAnimation(..) -> 41
    ClientboundInitializeBorder(..) -> 42
    ClientboundKeepAlive(..) -> 43
    ClientboundLevelChunkWithLight(..) -> 44
    ClientboundLevelEvent(..) -> 45
    ClientboundLevelParticles(..) -> 46
    ClientboundLightUpdate(..) -> 47
    ClientboundLogin(..) -> 48
    ClientboundMapItemData(..) -> 49
    ClientboundMerchantOffers(..) -> 50
    ClientboundMoveEntityPos(..) -> 51
    ClientboundMoveEntityPosRot(..) -> 52
    ClientboundMoveMinecartAlongTrack(..) -> 53
    ClientboundMoveEntityRot(..) -> 54
    ClientboundMoveVehicle(..) -> 55
    ClientboundOpenBook(..) -> 56
    ClientboundOpenScreen(..) -> 57
    ClientboundOpenSignEditor(..) -> 58
    ClientboundPing(..) -> 59
    ClientboundPongResponse(..) -> 60
    ClientboundPlaceGhostRecipe(..) -> 61
    ClientboundPlayerAbilities(..) -> 62
    ClientboundPlayerChat(..) -> 63
    ClientboundPlayerCombatEnd(..) -> 64
    ClientboundPlayerCombatEnter(..) -> 65
    ClientboundPlayerCombatKill(..) -> 66
    ClientboundPlayerInfoRemove(..) -> 67
    ClientboundPlayerInfoUpdate(..) -> 68
    ClientboundPlayerLookAt(..) -> 69
    ClientboundPlayerPosition(..) -> 70
    ClientboundPlayerRotation(..) -> 71
    ClientboundRecipeBookAdd(..) -> 72
    ClientboundRecipeBookRemove(..) -> 73
    ClientboundRecipeBookSettings(..) -> 74
    ClientboundRemoveEntities(..) -> 75
    ClientboundRemoveMobEffect(..) -> 76
    ClientboundResetScore(..) -> 77
    ClientboundResourcePackPop(..) -> 78
    ClientboundResourcePackPush(..) -> 79
    ClientboundRespawn(..) -> 80
    ClientboundRotateHead(..) -> 81
    ClientboundSectionBlocksUpdate(..) -> 82
    ClientboundSelectAdvancementsTab(..) -> 83
    ClientboundServerData(..) -> 84
    ClientboundSetActionBarText(..) -> 85
    ClientboundSetBorderCenter(..) -> 86
    ClientboundSetBorderLerpSize(..) -> 87
    ClientboundSetBorderSize(..) -> 88
    ClientboundSetBorderWarningDelay(..) -> 89
    ClientboundSetBorderWarningDistance(..) -> 90
    ClientboundSetCamera(..) -> 91
    ClientboundSetChunkCacheCenter(..) -> 92
    ClientboundSetChunkCacheRadius(..) -> 93
    ClientboundSetCursorItem(..) -> 94
    ClientboundSetDefaultSpawnPosition(..) -> 95
    ClientboundSetDisplayObjective(..) -> 96
    ClientboundSetEntityData(..) -> 97
    ClientboundSetEntityLink(..) -> 98
    ClientboundSetEntityMotion(..) -> 99
    ClientboundSetEquipment(..) -> 100
    ClientboundSetExperience(..) -> 101
    ClientboundSetHealth(..) -> 102
    ClientboundSetHeldSlot(..) -> 103
    ClientboundSetObjective(..) -> 104
    ClientboundSetPassengers(..) -> 105
    ClientboundSetPlayerInventory(..) -> 106
    ClientboundSetPlayerTeam(..) -> 107
    ClientboundSetScore(..) -> 108
    ClientboundSetSimulationDistance(..) -> 109
    ClientboundSetSubtitleText(..) -> 110
    ClientboundSetTime(..) -> 111
    ClientboundSetTitleText(..) -> 112
    ClientboundSetTitlesAnimation(..) -> 113
    ClientboundSoundEntity(..) -> 114
    ClientboundSound(..) -> 115
    ClientboundStartConfiguration(..) -> 116
    ClientboundStopSound(..) -> 117
    ClientboundStoreCookie(..) -> 118
    ClientboundSystemChat(..) -> 119
    ClientboundTabList(..) -> 120
    ClientboundTagQuery(..) -> 121
    ClientboundTakeItemEntity(..) -> 122
    ClientboundTeleportEntity(..) -> 123
    ClientboundTestInstanceBlockStatus(..) -> 124
    ClientboundTickingState(..) -> 125
    ClientboundTickingStep(..) -> 126
    ClientboundTransfer(..) -> 127
    ClientboundUpdateAdvancements(..) -> 128
    ClientboundUpdateAttributes(..) -> 129
    ClientboundUpdateMobEffect(..) -> 130
    ClientboundUpdateRecipes(..) -> 131
    ClientboundUpdateTags(..) -> 132
    ClientboundProjectilePower(..) -> 133
    ClientboundCustomReportDetails(..) -> 134
    ClientboundServerLinks(..) -> 135
    ClientboundWaypoint(..) -> 136
    ClientboundClearDialog(..) -> 137
    ClientboundShowDialog(..) -> 138
  }
}

pub fn encode(packet: Clientbound) -> bytes_tree.BytesTree {
  case packet {
    ClientboundBundleDelimiter(..) -> []
    ClientboundAddEntity(..) -> []
    ClientboundAnimate(..) -> []
    ClientboundAwardStats(..) -> []
    ClientboundBlockChangedAck(..) -> []
    ClientboundBlockDestruction(..) -> []
    ClientboundBlockEntityData(..) -> []
    ClientboundBlockEvent(..) -> []
    ClientboundBlockUpdate(..) -> []
    ClientboundBossEvent(..) -> []
    ClientboundChangeDifficulty(..) -> []
    ClientboundChunkBatchFinished(..) -> []
    ClientboundChunkBatchStart(..) -> []
    ClientboundChunksBiomes(..) -> []
    ClientboundClearTitles(..) -> []
    ClientboundCommandSuggestions(..) -> []
    ClientboundCommands(..) -> []
    ClientboundContainerClose(..) -> []
    ClientboundContainerSetContent(..) -> []
    ClientboundContainerSetData(..) -> []
    ClientboundContainerSetSlot(..) -> []
    ClientboundCookieRequest(..) -> []
    ClientboundCooldown(..) -> []
    ClientboundCustomChatCompletions(..) -> []
    ClientboundCustomPayload(..) -> []
    ClientboundDamageEvent(..) -> []
    ClientboundDebugBlockValue(..) -> []
    ClientboundDebugChunkValue(..) -> []
    ClientboundDebugEntityValue(..) -> []
    ClientboundDebugEvent(..) -> []
    ClientboundDebugSample(..) -> []
    ClientboundDeleteChat(..) -> []
    ClientboundDisconnect(..) -> []
    ClientboundDisguisedChat(..) -> []
    ClientboundEntityEvent(..) -> []
    ClientboundEntityPositionSync(..) -> []
    ClientboundExplode(..) -> []
    ClientboundForgetLevelChunk(..) -> []
    ClientboundGameEvent(..) -> []
    ClientboundGameTestHighlightPos(..) -> []
    ClientboundMountScreenOpen(..) -> []
    ClientboundHurtAnimation(..) -> []
    ClientboundInitializeBorder(..) -> []
    ClientboundKeepAlive(..) -> [encoder.long(packet.id)]
    ClientboundLevelChunkWithLight(..) -> []
    ClientboundLevelEvent(..) -> []
    ClientboundLevelParticles(..) -> []
    ClientboundLightUpdate(..) -> []
    ClientboundLogin(..) -> []
    ClientboundMapItemData(..) -> []
    ClientboundMerchantOffers(..) -> []
    ClientboundMoveEntityPos(..) -> []
    ClientboundMoveEntityPosRot(..) -> []
    ClientboundMoveMinecartAlongTrack(..) -> []
    ClientboundMoveEntityRot(..) -> []
    ClientboundMoveVehicle(..) -> []
    ClientboundOpenBook(..) -> []
    ClientboundOpenScreen(..) -> []
    ClientboundOpenSignEditor(..) -> []
    ClientboundPing(..) -> [encoder.int(packet.id)]
    ClientboundPongResponse(..) -> []
    ClientboundPlaceGhostRecipe(..) -> []
    ClientboundPlayerAbilities(..) -> []
    ClientboundPlayerChat(..) -> []
    ClientboundPlayerCombatEnd(..) -> []
    ClientboundPlayerCombatEnter(..) -> []
    ClientboundPlayerCombatKill(..) -> []
    ClientboundPlayerInfoRemove(..) -> []
    ClientboundPlayerInfoUpdate(..) -> []
    ClientboundPlayerLookAt(..) -> []
    ClientboundPlayerPosition(..) -> []
    ClientboundPlayerRotation(..) -> []
    ClientboundRecipeBookAdd(..) -> []
    ClientboundRecipeBookRemove(..) -> []
    ClientboundRecipeBookSettings(..) -> []
    ClientboundRemoveEntities(..) -> []
    ClientboundRemoveMobEffect(..) -> []
    ClientboundResetScore(..) -> []
    ClientboundResourcePackPop(..) -> []
    ClientboundResourcePackPush(..) -> []
    ClientboundRespawn(..) -> []
    ClientboundRotateHead(..) -> []
    ClientboundSectionBlocksUpdate(..) -> []
    ClientboundSelectAdvancementsTab(..) -> []
    ClientboundServerData(..) -> []
    ClientboundSetActionBarText(..) -> []
    ClientboundSetBorderCenter(..) -> []
    ClientboundSetBorderLerpSize(..) -> []
    ClientboundSetBorderSize(..) -> []
    ClientboundSetBorderWarningDelay(..) -> []
    ClientboundSetBorderWarningDistance(..) -> []
    ClientboundSetCamera(..) -> []
    ClientboundSetChunkCacheCenter(..) -> []
    ClientboundSetChunkCacheRadius(..) -> []
    ClientboundSetCursorItem(..) -> []
    ClientboundSetDefaultSpawnPosition(..) -> []
    ClientboundSetDisplayObjective(..) -> []
    ClientboundSetEntityData(..) -> []
    ClientboundSetEntityLink(..) -> []
    ClientboundSetEntityMotion(..) -> []
    ClientboundSetEquipment(..) -> []
    ClientboundSetExperience(..) -> []
    ClientboundSetHealth(..) -> []
    ClientboundSetHeldSlot(..) -> []
    ClientboundSetObjective(..) -> []
    ClientboundSetPassengers(..) -> []
    ClientboundSetPlayerInventory(..) -> []
    ClientboundSetPlayerTeam(..) -> []
    ClientboundSetScore(..) -> []
    ClientboundSetSimulationDistance(..) -> []
    ClientboundSetSubtitleText(..) -> []
    ClientboundSetTime(..) -> []
    ClientboundSetTitleText(..) -> []
    ClientboundSetTitlesAnimation(..) -> []
    ClientboundSoundEntity(..) -> []
    ClientboundSound(..) -> []
    ClientboundStartConfiguration(..) -> []
    ClientboundStopSound(..) -> []
    ClientboundStoreCookie(..) -> []
    ClientboundSystemChat(..) -> []
    ClientboundTabList(..) -> []
    ClientboundTagQuery(..) -> []
    ClientboundTakeItemEntity(..) -> []
    ClientboundTeleportEntity(..) -> []
    ClientboundTestInstanceBlockStatus(..) -> []
    ClientboundTickingState(..) -> []
    ClientboundTickingStep(..) -> []
    ClientboundTransfer(..) -> []
    ClientboundUpdateAdvancements(..) -> []
    ClientboundUpdateAttributes(..) -> []
    ClientboundUpdateMobEffect(..) -> []
    ClientboundUpdateRecipes(..) -> []
    ClientboundUpdateTags(..) -> []
    ClientboundProjectilePower(..) -> []
    ClientboundCustomReportDetails(..) -> []
    ClientboundServerLinks(..) -> []
    ClientboundWaypoint(..) -> []
    ClientboundClearDialog(..) -> []
    ClientboundShowDialog(..) -> []
  }
  |> list.fold(bytes_tree.new(), bytes_tree.append)
}
