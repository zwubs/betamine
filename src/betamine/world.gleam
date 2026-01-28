import betamine/common/block/block_state
import betamine/common/chunk_position
import betamine/constant
import betamine/message
import betamine/protocol/common/chunk
import betamine/world/generation
import gleam/dict
import gleam/erlang/process
import gleam/list
import gleam/otp/actor
import gleam/otp/supervision
import gleam/set

type Message =
  message.WorldMessage

type Name =
  process.Name(Message)

type World {
  World(
    generation_options: generation.GenerationOptions,
    chunks: dict.Dict(chunk_position.ChunkPosition, chunk.Chunk),
  )
}

pub fn supervised(
  name: Name,
) -> supervision.ChildSpecification(process.Subject(Message)) {
  supervision.worker(fn() { start(name) })
}

pub fn start(
  name: Name,
) -> Result(actor.Started(process.Subject(Message)), actor.StartError) {
  actor.new(World(
    generation.GenerationOptions(
      seed: 0.0,
      chunk_section_count: 24,
      water_level: 80,
      min_terrain_height: 64,
      max_terrain_height: 96,
    ),
    dict.new(),
  ))
  |> actor.on_message(loop)
  |> actor.named(name)
  |> actor.start()
}

fn loop(world: World, message: Message) -> actor.Next(World, Message) {
  case message {
    message.GenerateSpawnChunks -> {
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
      let chunks =
        set.fold(chunk_positions, world.chunks, fn(chunks, position) {
          let chunk =
            generation.generate_chunk(position, world.generation_options)
          dict.insert(chunks, position, chunk)
        })
      actor.continue(World(..world, chunks:))
    }
    message.GetAllChunks(subject:) -> {
      process.send(subject, dict.to_list(world.chunks))
      actor.continue(world)
    }
    message.GetChunk(subject:, chunk_position:) -> {
      case dict.get(world.chunks, chunk_position) {
        Ok(chunk) -> {
          process.send(subject, chunk)
          actor.continue(world)
        }
        _ -> {
          let chunk =
            generation.generate_chunk(chunk_position, world.generation_options)
          process.send(subject, chunk)
          let chunks = dict.insert(world.chunks, chunk_position, chunk)
          actor.continue(World(..world, chunks:))
        }
      }
    }
    message.GetBlock(subject:, block_position:) -> {
      let chunk_position = chunk_position.from_block_position(block_position)
      case dict.get(world.chunks, chunk_position) {
        Ok(_) -> Ok(block_state.air)
        _ -> Error(Nil)
      }
      |> process.send(subject, _)
      actor.continue(world)
    }
    message.PlaceBlock(subject:, block_position:, state:) -> todo
  }
}
