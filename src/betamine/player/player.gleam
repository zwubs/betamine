import betamine/common/chunk_position
import betamine/common/client_information
import betamine/common/entity
import betamine/common/entity/entity_kind
import betamine/common/position
import betamine/common/profile
import betamine/common/rotation
import betamine/common/uuid
import betamine/constant
import betamine/mojang
import betamine/player/player_manager
import betamine/protocol/common/chunk
import betamine/world
import gleam/erlang/process
import gleam/int
import gleam/list
import gleam/option
import gleam/otp/actor
import gleam/set

pub type Message {
  UpdateClientInformation(
    client_information: client_information.ClientInformation,
  )
  GetSpawnInformation(
    return_subject: process.Subject(
      #(profile.Profile, client_information.ClientInformation, entity.Entity),
    ),
  )
  LoadChunks(return_subject: process.Subject(chunk.Chunk))
  Move(
    position: option.Option(position.Position),
    rotation: option.Option(rotation.Rotation),
    on_ground: Bool,
    against_wall: Bool,
  )
}

pub type State {
  State(
    profile: profile.Profile,
    client_information: client_information.ClientInformation,
    entity: entity.Entity,
    loaded_chunks: set.Set(chunk_position.ChunkPosition),
    world_subject: process.Subject(world.Message),
  )
}

pub fn start(
  uuid: uuid.Uuid,
  manager_name: player_manager.Name,
  world_name: world.Name,
) -> Result(
  actor.Started(#(process.Subject(Message), profile.Profile)),
  actor.StartError,
) {
  let world_subject = process.named_subject(world_name)
  actor.new_with_initialiser(10_000, fn(subject) {
    let assert Ok(profile) = mojang.fetch_profile(uuid)
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
      )
    actor.initialised(state)
    |> actor.returning(#(subject, profile))
    |> Ok
  })
  |> actor.on_message(handle_message)
  |> actor.start
}

fn handle_message(state: State, message: Message) -> actor.Next(State, Message) {
  case message {
    UpdateClientInformation(client_information:) ->
      State(..state, client_information:)
    GetSpawnInformation(return_subject:) -> {
      process.send(return_subject, #(
        state.profile,
        state.client_information,
        state.entity,
      ))
      state
    }
    LoadChunks(return_subject:) -> {
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
          world.GetChunk(return_subject:, chunk_position:),
        )
      })
      State(..state, loaded_chunks: chunk_positions)
    }
    Move(position:, rotation:, on_ground:, against_wall:) -> {
      case position, rotation {
        option.Some(position), option.Some(rotation) -> {
          todo
        }
        option.Some(position), option.None -> {
          todo
        }
        option.None, option.Some(rotation) -> {
          todo
        }
        option.None, option.None -> {
          todo
        }
      }
    }
  }
  |> actor.continue()
}
