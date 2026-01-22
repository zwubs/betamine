import betamine/common/block/block_state
import betamine/message
import betamine/protocol/common/chunk
import betamine/world/generation
import gleam/dict
import gleam/erlang/process
import gleam/int
import gleam/list
import gleam/otp/actor
import gleam/result

type World {
  World(
    world_generation_options: generation.WorldGenerationOptions,
    chunk_generation_options: generation.ChunkGenerationOptions,
    chunks: dict.Dict(#(Int, Int), chunk.Chunk),
  )
}

pub fn start() -> Result(
  process.Subject(message.WorldMessage),
  actor.StartError,
) {
  actor.new(World(
    generation.WorldGenerationOptions(
      seed: 0.0,
      chunk_length: 8,
      water_level: 0,
      min_terrain_height: -16,
      max_terrain_height: 16,
    ),
    generation.ChunkGenerationOptions(
      seed: 0.0,
      chunk_section_count: 24,
      water_level: 0,
      min_terrain_height: -16,
      max_terrain_height: 16,
    ),
    dict.new(),
  ))
  |> actor.on_message(loop)
  |> actor.start()
  |> result.map(fn(started) {
    let subject = started.data
    // actor.send(subject, message.GenerateWorld)
    subject
  })
}

fn loop(
  world: World,
  message: message.WorldMessage,
) -> actor.Next(World, message.WorldMessage) {
  case message {
    message.GenerateWorld -> {
      echo "GENERATING CHUNKS"
      // let chunks = generation.generate(world.world_generation_options)
      let world_chunk_range = list.range(-5, 4)
      let chunks =
        list.fold(world_chunk_range, dict.new(), fn(chunks, x) {
          list.fold(world_chunk_range, chunks, fn(chunks, z) {
            dict.insert(
              chunks,
              #(x, z),
              generation.generate_chunk(x, z, world.chunk_generation_options),
            )
          })
        })
      echo "CHUNKS GENERATED"
      actor.continue(World(..world, chunks:))
    }
    message.GetAllChunks(subject:) -> {
      process.send(subject, dict.to_list(world.chunks))
      actor.continue(world)
    }
    message.GetChunk(subject:, x:, z:) -> {
      case dict.get(world.chunks, #(x, z)) {
        Ok(chunk) -> {
          process.send(subject, Ok(chunk))
          actor.continue(world)
        }
        _ -> {
          let chunk =
            generation.generate_chunk(x, z, world.chunk_generation_options)
          process.send(subject, Ok(chunk))
          let chunks = dict.insert(world.chunks, #(x, z), chunk)
          actor.continue(World(..world, chunks:))
        }
      }
    }
    message.GetBlock(subject:, x:, y:, z:) -> {
      let chunk_x = x / 16
      let chunk_z = z / 16
      case dict.get(world.chunks, #(chunk_x, chunk_z)) {
        Ok(_) -> Ok(block_state.air)
        _ -> Error(Nil)
      }
      |> process.send(subject, _)
      actor.continue(world)
    }
    message.PlaceBlock(subject:, x:, y:, z:, state:) -> todo
  }
}
