import betamine/common/chunk_position
import betamine/player/message as player_message
import betamine/protocol/common/chunk
import betamine/world/generation
import betamine/world/message
import gleam/dict
import gleam/erlang/process
import gleam/otp/actor
import gleam/otp/supervision

pub type Returning {
  Returning(subject: message.Subject)
}

type State {
  State(
    generation_options: generation.GenerationOptions,
    chunks: dict.Dict(chunk_position.ChunkPosition, chunk.Chunk),
  )
}

pub fn supervised(
  name: message.Name,
) -> supervision.ChildSpecification(Returning) {
  supervision.worker(fn() { start(name) })
}

pub fn start(
  name: message.Name,
) -> Result(actor.Started(Returning), actor.StartError) {
  actor.new_with_initialiser(1000, fn(subject) {
    actor.initialised(State(
      generation.GenerationOptions(
        seed: 0.0,
        chunk_section_count: 24,
        water_level: 80,
        min_terrain_height: 64,
        max_terrain_height: 96,
      ),
      dict.new(),
    ))
    |> actor.selecting(process.select(process.new_selector(), subject))
    |> actor.returning(Returning(subject:))
    |> Ok
  })
  |> actor.on_message(handle_message)
  |> actor.named(name)
  |> actor.start()
}

fn handle_message(state: State, message: message.Message) {
  case message {
    message.GetChunk(return_subject:, chunk_position:) ->
      handle_get_chunk(state, return_subject, chunk_position)
  }
}

fn handle_get_chunk(
  state: State,
  return_subject: player_message.PlayerSubject,
  chunk_position: chunk_position.ChunkPosition,
) {
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
