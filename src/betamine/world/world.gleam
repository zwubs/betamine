import betamine/common/block/block_state
import betamine/common/block_position
import betamine/common/chunk_position
import betamine/constant
import betamine/player/message as player_message
import betamine/protocol/common/chunk
import betamine/world/generation
import betamine/world/message
import gleam/dict
import gleam/erlang/process
import gleam/list
import gleam/otp/actor
import gleam/otp/supervision
import gleam/set

pub type Message {
  PlayerCommand(message.PlayerCommand)
}

pub type Name =
  process.Name(Message)

pub type Subject =
  process.Subject(Message)

type State {
  State(
    generation_options: generation.GenerationOptions,
    chunks: dict.Dict(chunk_position.ChunkPosition, chunk.Chunk),
  )
}

pub fn supervised(name: Name) -> supervision.ChildSpecification(Subject) {
  supervision.worker(fn() { start(name) })
}

pub fn start(name: Name) -> Result(actor.Started(Subject), actor.StartError) {
  actor.new(State(
    generation.GenerationOptions(
      seed: 0.0,
      chunk_section_count: 24,
      water_level: 80,
      min_terrain_height: 64,
      max_terrain_height: 96,
    ),
    dict.new(),
  ))
  |> actor.on_message(handle_message)
  |> actor.named(name)
  |> actor.start()
}

fn handle_message(state: State, message: Message) {
  case message {
    PlayerCommand(player_command) ->
      handle_player_command(state, player_command)
  }
}

fn handle_player_command(state: State, player_command: message.PlayerCommand) {
  case player_command {
    message.GetChunk(return_subject:, chunk_position:) -> {
      case dict.get(state.chunks, chunk_position) {
        Ok(chunk) -> {
          process.send(return_subject, player_message.ChunkLoaded(chunk))
          actor.continue(state)
        }
        _ -> {
          let chunk =
            generation.generate_chunk(chunk_position, state.generation_options)
          process.send(return_subject, player_message.ChunkLoaded(chunk))
          let chunks = dict.insert(state.chunks, chunk_position, chunk)
          actor.continue(State(..state, chunks:))
        }
      }
    }
  }
}
