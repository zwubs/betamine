import betamine/common/chunk_position
import betamine/common/client_information
import betamine/common/entity
import betamine/common/entity/entity_kind
import betamine/common/position
import betamine/common/profile
import betamine/common/uuid
import betamine/constant
import betamine/mojang
import betamine/player/message
import betamine/session/message as session_message
import betamine/world/message as world_message
import betamine/world/world
import gleam/bool
import gleam/erlang/process
import gleam/int
import gleam/list
import gleam/option
import gleam/otp/actor
import gleam/set

pub type Message {
  SessionCommand(message.SessionCommand)
  WorldEvent(message.WorldEvent)
}

type State {
  State(
    profile: profile.Profile,
    client_information: client_information.ClientInformation,
    entity: entity.Entity,
    loaded_chunks: set.Set(chunk_position.ChunkPosition),
    world_subject: world.Subject,
    session_subject: process.Subject(session_message.PlayerEvent),
    world_event_subject: process.Subject(message.WorldEvent),
  )
}

pub fn start(
  uuid: uuid.Uuid,
  session_subject: process.Subject(session_message.PlayerEvent),
  world_name: world.Name,
) -> Result(
  actor.Started(#(process.Subject(message.SessionCommand), profile.Profile)),
  actor.StartError,
) {
  let world_subject = process.named_subject(world_name)
  actor.new_with_initialiser(10_000, fn(_) {
    let assert Ok(profile) = mojang.fetch_profile(uuid)
    let world_event_subject = process.new_subject()
    let session_command_subject = process.new_subject()
    let selector =
      process.new_selector()
      |> process.select_map(world_event_subject, WorldEvent)
      |> process.select_map(session_command_subject, SessionCommand)
    let state: State =
      State(
        profile,
        client_information.default(),
        entity.Entity(
          ..entity.new(entity_kind.Player),
          uuid:,
          position: constant.mc_player_spawn_point,
        ),
        set.new(),
        world_subject:,
        session_subject:,
        world_event_subject:,
      )
    actor.initialised(state)
    |> actor.selecting(selector)
    |> actor.returning(#(session_command_subject, profile))
    |> Ok
  })
  |> actor.on_message(handle_message)
  |> actor.start
}

fn handle_message(state: State, message: Message) {
  case message {
    SessionCommand(session_command) ->
      handle_session_command(state, session_command)
    WorldEvent(world_event) -> handle_world_event(state, world_event)
  }
}

fn handle_session_command(
  state: State,
  message: message.SessionCommand,
) -> actor.Next(State, Message) {
  case message {
    message.UpdateClientInformation(client_information:) ->
      State(..state, client_information:)
    message.GetSpawnInformation(return_subject:) -> {
      process.send(return_subject, #(
        state.profile,
        state.client_information,
        state.entity,
      ))
      state
    }
    message.LoadInitialChunks -> {
      let chunk_range =
        list.range({ constant.mc_view_distance + 1 } * -1, {
          constant.mc_view_distance + 1
        })
      let chunk_positions =
        list.fold(chunk_range, set.new(), fn(positions, x) {
          list.fold(chunk_range, positions, fn(positions, z) {
            set.insert(positions, chunk_position.new(x, z))
          })
        })
      let player_chunk_position =
        chunk_position.from_position(state.entity.position)
      let sorted_chunk_positions =
        list.sort(set.to_list(chunk_positions), fn(a, b) {
          int.compare(
            chunk_position.chebyshev_distance(player_chunk_position, a),
            chunk_position.chebyshev_distance(player_chunk_position, b),
          )
        })
      list.each(sorted_chunk_positions, fn(chunk_position) {
        process.send(
          state.world_subject,
          world.PlayerCommand(world_message.GetChunk(
            state.world_event_subject,
            chunk_position:,
          )),
        )
      })
      State(..state, loaded_chunks: chunk_positions)
    }
    message.Move(position:, rotation:, on_ground:, against_wall:) -> {
      case position {
        option.Some(position) -> handle_move_position(state, position)
        _ -> state
      }
    }
  }
  |> actor.continue()
}

fn handle_move_position(state: State, position: position.Position) -> State {
  let from_chunk = chunk_position.from_position(state.entity.position)
  let to_chunk = chunk_position.from_position(position)

  let entity = entity.Entity(..state.entity, position:)
  let state = State(..state, entity:)
  use <- bool.guard(from_chunk == to_chunk, state)
  let chunk_range =
    list.range({ constant.mc_view_distance + 1 } * -1, {
      constant.mc_view_distance + 1
    })
  let chunk_positions =
    list.fold(chunk_range, set.new(), fn(positions, x) {
      list.fold(chunk_range, positions, fn(positions, z) {
        set.insert(
          positions,
          chunk_position.new(x + to_chunk.x, z + to_chunk.z),
        )
      })
    })

  let chunk_positions_to_load =
    set.difference(chunk_positions, state.loaded_chunks)
  let _ =
    set.each(chunk_positions_to_load, fn(chunk_position) {
      process.send(
        state.world_subject,
        world.PlayerCommand(world_message.GetChunk(
          state.world_event_subject,
          chunk_position:,
        )),
      )
    })

  let chunk_positions_to_unload =
    set.difference(state.loaded_chunks, chunk_positions)
  let _ =
    set.each(chunk_positions_to_unload, fn(chunk_position) {
      process.send(
        state.session_subject,
        session_message.ChunkUnloaded(chunk_position),
      )
    })

  process.send(
    state.session_subject,
    session_message.CenterChunkChanged(to_chunk),
  )
  State(..state, loaded_chunks: chunk_positions)
}

fn handle_world_event(
  state: State,
  world_event: message.WorldEvent,
) -> actor.Next(State, Message) {
  case world_event {
    message.ChunkLoaded(chunk) -> {
      process.send(state.session_subject, session_message.ChunkLoaded(chunk))
      state
    }
  }
  |> actor.continue()
}
