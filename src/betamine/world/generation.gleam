import betamine/common/block/block_state
import betamine/common/chunk_position
import betamine/common/chunk_section_position
import betamine/constant.{mc_world_chunk_sections_per_chunk}
import betamine/perlin
import betamine/protocol/common/chunk
import betamine/protocol/common/chunk/chunk_section
import betamine/protocol/common/chunk/paletted_container
import gleam/float
import gleam/int
import gleam/list
import gleam/result
import gleam/set
import iv

const octaves = [#(1.0, -8.0), #(2.0, 16.0), #(8.0, 2.0)]

const summed_amplitude = 12.0

pub type GenerationOptions {
  GenerationOptions(
    seed: Float,
    water_level: Int,
    chunk_section_count: Int,
    max_terrain_height: Int,
    min_terrain_height: Int,
  )
}

pub fn generate_chunk(
  position: chunk_position.ChunkPosition,
  options: GenerationOptions,
) {
  let world_chunk_section_range =
    list.range(
      constant.mc_world_chunk_offset,
      mc_world_chunk_sections_per_chunk + constant.mc_world_chunk_offset - 1,
    )

  list.fold(world_chunk_section_range, [], fn(chunk_sections, chunk_section_y) {
    let block_y = chunk_section_y * 16
    case block_y {
      _ if block_y > options.max_terrain_height -> chunk_section.empty
      _ if block_y + 15 < options.min_terrain_height -> chunk_section.default
      _ -> {
        let chunk_section_position =
          chunk_section_position.new(position.x, chunk_section_y, position.z)
        generate_chunk_section(chunk_section_position, options)
      }
    }
    |> list.prepend(chunk_sections, _)
  })
  |> list.reverse
  |> chunk.Chunk(position, [], _)
}

pub fn generate_chunk_section(
  position: chunk_section_position.ChunkSectionPosition,
  options: GenerationOptions,
) -> chunk_section.ChunkSection {
  let relative_chunk_section_range = list.range(0, 15)
  let empty_chunk_section_array =
    iv.initialise(16 * 16 * 16, fn(_) { block_state.Air })

  let #(array, palette) =
    list.fold(
      relative_chunk_section_range,
      #(empty_chunk_section_array, set.new()),
      fn(array_palette_pair, relative_x) {
        let global_x = position.x * 16 + relative_x
        list.fold(
          relative_chunk_section_range,
          array_palette_pair,
          fn(array_palette_pair, relative_z) {
            let global_z = position.z * 16 + relative_z
            let terrain_y =
              options.min_terrain_height
              + float.truncate(
                calculate_noise(options.seed, global_x, global_z)
                *. int.to_float(
                  options.max_terrain_height - options.min_terrain_height,
                ),
              )
            list.fold(
              relative_chunk_section_range,
              array_palette_pair,
              fn(array_palette_pair, relative_y) {
                let #(array, palette) = array_palette_pair
                let global_y = position.y * 16 + relative_y
                let block_state = case global_y {
                  y if y == terrain_y && y < options.water_level ->
                    block_state.sand
                  y if y == terrain_y -> block_state.grass_block
                  y if y < terrain_y -> block_state.dirt
                  y if y > terrain_y && y <= options.water_level ->
                    block_state.water
                  _ -> block_state.air
                }
                let index = relative_y * 256 + relative_z * 16 + relative_x
                case block_state {
                  block_state.Air -> array_palette_pair
                  block_state -> {
                    let array = iv.try_set(array, index, block_state)
                    let palette = set.insert(palette, block_state)
                    #(array, palette)
                  }
                }
              },
            )
          },
        )
      },
    )

  let palette = [block_state.air, ..set.to_list(palette)]
  let indexed_palette = iv.from_list(palette)
  let int_palette = list.map(palette, block_state.to_int)

  chunk_section.ChunkSection(
    ..chunk_section.empty,
    block_count: iv.fold(array, 0, fn(block_count, block_state) {
      case block_state {
        block_state.Air -> block_count
        _ -> block_count + 1
      }
    }),
    block_states: paletted_container.PalettedContainer(
      data: iv.map(array, fn(block_state) {
        iv.index_of(indexed_palette, block_state) |> result.unwrap(0)
      })
        |> iv.to_list,
      palette: chunk_section.indirect_block_palette(int_palette),
    ),
  )
}

fn calculate_noise(seed: Float, x: Int, z: Int) {
  let amplified_value =
    list.fold(octaves, 0.0, fn(value, octave) {
      let #(frequency, amplitude) = octave
      let x = int.to_float(x) /. 128.0 *. frequency
      let z = int.to_float(z) /. 128.0 *. frequency
      value +. perlin.noise(x, seed, z) *. amplitude
    })
  { amplified_value /. summed_amplitude +. 1.0 } /. 2.0
}
