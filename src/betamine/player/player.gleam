import betamine/common/chunk_position
import betamine/common/client_information
import betamine/common/entity
import betamine/common/entity/entity_kind
import betamine/common/math/vector3
import betamine/common/position
import betamine/common/profile
import betamine/common/rotation
import betamine/common/uuid
import betamine/constant
import betamine/mojang
import betamine/player/message
import betamine/session/message as session_message
import betamine/world/message as world_message
import gleam/bool
import gleam/erlang/process
import gleam/float
import gleam/int
import gleam/list
import gleam/option
import gleam/otp/actor
import gleam/set

type Message =
  message.PlayerMessage

type Subject =
  message.PlayerSubject

pub type Requiring {
  Requiring(
    uuid: uuid.Uuid,
    session_subject: session_message.Subject,
    world_subject: world_message.Subject,
    manager_subject: message.ManagerSubject,
  )
}

pub type Returning {
  Returning(profile: profile.Profile, subject: Subject)
}

type State {
  State(
    subject: Subject,
    profile: profile.Profile,
    client_information: client_information.ClientInformation,
    entity: entity.Entity,
    loaded_chunks: set.Set(chunk_position.ChunkPosition),
    world_subject: world_message.Subject,
    session_subject: session_message.Subject,
    manager_subject: message.ManagerSubject,
  )
}

pub fn start(requiring: Requiring) {
  let Requiring(uuid:, session_subject:, world_subject:, manager_subject:) =
    requiring
  actor.new_with_initialiser(10_000, fn(subject) {
    let assert Ok(profile) = mojang.fetch_profile(uuid)
    let state: State =
      State(
        subject,
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
        manager_subject:,
      )
    actor.initialised(state)
    |> actor.selecting(process.select(process.new_selector(), subject))
    |> actor.returning(Returning(profile:, subject:))
    |> Ok
  })
  |> actor.on_message(handle_message)
  |> actor.start
}

fn handle_message(state: State, message: Message) {
  case message {
    message.UpdateClientInformation(client_information:) ->
      actor.continue(State(..state, client_information:))
    message.GetSpawnInformation(return_subject:) -> {
      process.send(return_subject, #(
        state.profile,
        state.client_information,
        state.entity,
      ))
      actor.continue(state)
    }
    message.LoadInitialChunks -> {
      handle_load_initial_chunks(state)
      |> actor.continue()
    }
    message.Move(position:, rotation:, on_ground:, ..) -> {
      handle_move(state, position, rotation, on_ground)
      |> actor.continue()
    }
    message.ChunkLoaded(chunk) -> {
      process.send(state.session_subject, session_message.ChunkLoaded(chunk))
      actor.continue(state)
    }
    message.Stop -> actor.stop()
    message.PlayerMoved(entity_id:, position_delta:, rotation:, on_ground:, ..) -> {
      process.send(
        state.session_subject,
        session_message.EntityMoved(
          entity_id,
          position_delta:,
          rotation:,
          on_ground:,
        ),
      )
      actor.continue(state)
    }
  }
}

fn handle_load_initial_chunks(state: State) -> State {
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
      world_message.GetChunk(state.subject, chunk_position:),
    )
  })
  State(..state, loaded_chunks: chunk_positions)
}

fn handle_move(
  state: State,
  position: option.Option(vector3.Vector3(Float)),
  rotation: option.Option(rotation.Rotation),
  on_ground: Bool,
) -> State {
  let state = case position {
    option.Some(position) -> handle_update_position(state, position)
    _ -> state
  }
  let state = case rotation {
    option.Some(rotation) -> handle_update_rotation(state, rotation)
    _ -> state
  }
  let position_delta =
    option.map(position, vector3.map2(_, state.entity.position, float.subtract))
  process.send(
    state.manager_subject,
    message.MessageOtherPlayers(
      state.profile.id,
      message.PlayerMoved(
        state.profile.id,
        state.entity.id,
        position_delta,
        rotation,
        on_ground,
      ),
    ),
  )
  state
}

fn handle_update_position(state: State, position: position.Position) -> State {
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
        world_message.GetChunk(state.subject, chunk_position:),
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

fn handle_update_rotation(state: State, rotation: rotation.Rotation) -> State {
  let entity = entity.Entity(..state.entity, rotation:)
  State(..state, entity:)
}
