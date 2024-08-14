import betamine/common/position.{type Position}
import betamine/constants
import betamine/encoder as encode
import gleam/bytes_builder
import gleam/list
import gleam/option.{type Option}

pub type Request {
  Request(
    entity_id: Int,
    is_hardcore: Bool,
    dimensions: List(#(String, String)),
    max_player_count: Int,
    view_distance: Int,
    simulation_distance: Int,
    reduced_debug_info: Bool,
    enable_respawn_screen: Bool,
    do_limited_crafting: Bool,
    dimension_type: Int,
    dimension_name: #(String, String),
    hashed_seed: Int,
    game_mode: Int,
    previous_game_mode: Int,
    is_debug: Bool,
    is_flat: Bool,
    has_death_location: Bool,
    death_dimension_name: Option(String),
    death_position: Option(Position),
    portal_cooldown: Int,
    enforce_secure_chat: Bool,
  )
}

pub const default = Request(
  entity_id: 0,
  is_hardcore: False,
  dimensions: [#("minecraft", "overworld")],
  max_player_count: constants.mc_max_player_count,
  view_distance: constants.mc_view_distance,
  simulation_distance: constants.mc_simulation_distance,
  reduced_debug_info: False,
  enable_respawn_screen: False,
  do_limited_crafting: False,
  dimension_type: 0,
  dimension_name: #("minecraft", "overworld"),
  hashed_seed: 0,
  game_mode: 0,
  previous_game_mode: -1,
  is_debug: False,
  is_flat: False,
  has_death_location: False,
  death_dimension_name: option.None,
  death_position: option.None,
  portal_cooldown: 0,
  enforce_secure_chat: False,
)

pub fn serialize(request: Request) {
  bytes_builder.new()
  |> encode.int(request.entity_id)
  |> encode.bool(request.is_hardcore)
  |> encode.var_int(list.length(request.dimensions))
  |> encode.array(request.dimensions, encode.identifier)
  |> encode.var_int(request.max_player_count)
  |> encode.var_int(request.view_distance)
  |> encode.var_int(request.simulation_distance)
  |> encode.bool(request.reduced_debug_info)
  |> encode.bool(request.enable_respawn_screen)
  |> encode.bool(request.do_limited_crafting)
  |> encode.var_int(request.dimension_type)
  |> encode.identifier(request.dimension_name)
  |> encode.long(request.hashed_seed)
  |> encode.byte(request.game_mode)
  |> encode.byte(request.previous_game_mode)
  |> encode.bool(request.is_debug)
  |> encode.bool(request.is_flat)
  // Ignoring death location for now
  |> encode.bool(False)
  |> encode.var_int(request.portal_cooldown)
  |> encode.bool(request.enforce_secure_chat)
}
