import betamine/encoder as encode
import gleam/bytes_builder
import gleam/option.{type Option}

pub type Position {
  Position(x: Float, y: Float, z: Float)
}

pub type LoginPlay {
  LoginPlay(
    entity_id: Int,
    is_hardcore: Bool,
    dimensions: List(String),
    max_player_count: Int,
    view_distance: Int,
    simulation_distance: Int,
    reduced_debug_info: Bool,
    enable_respawn_screen: Bool,
    do_limited_crafting: Bool,
    dimension_type: Int,
    dimension_name: String,
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

pub fn serialize() {
  // Entity Id (Player)
  encode.int(bytes_builder.new(), 0)
  // Is Hardcore
  |> encode.bool(False)
  // Dimension Count
  |> encode.var_int(1)
  // Dimension Names
  |> encode.array(["minecraft:overworld"], encode.string)
  // Max Player Count
  |> encode.var_int(2)
  // View Distance
  |> encode.var_int(2)
  // Simulation Distance
  |> encode.var_int(2)
  // Reduded Debug Info
  |> encode.bool(False)
  // Enable Respawn Screen
  |> encode.bool(True)
  // Do Limited Crafting
  |> encode.bool(False)
  // Dimension Type
  |> encode.var_int(0)
  // Dimension Name
  |> encode.identifier("minecraft", "overworld")
  // Hashed Seed
  |> encode.long(0)
  // Game Mode
  |> encode.byte(0)
  // Previous Game Mode
  |> encode.byte(-1)
  // Is Debug
  |> encode.bool(False)
  // Is Flat
  |> encode.bool(False)
  // Has Death Location (Determines Existence Of Next Two)
  |> encode.bool(False)
  // Death Dimension Name
  // |> encode.identifier("minecraft", "overworld")
  // Death Location
  // |> encode.position(0.0, 0.0, 0.0)
  // Portal Cooldown
  |> encode.var_int(0)
  // Enforces Secure Chat
  |> encode.bool(False)
}
