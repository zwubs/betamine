import betamine/common/block/block_state
import betamine/common/chunk_position
import betamine/constant.{mc_world_chunk_sections_per_chunk}
import betamine/perlin
import betamine/protocol/common/chunk
import betamine/protocol/common/chunk/chunk_section
import betamine/protocol/common/chunk/paletted_container
import gleam/dict
import gleam/float
import gleam/int
import gleam/list
import iv

const octaves = [#(1.0, -8.0), #(2.0, 16.0), #(8.0, 2.0)]

const summed_amplitude = 12.0

pub type ChunkGenerationOptions {
  ChunkGenerationOptions(
    seed: Float,
    water_level: Int,
    chunk_section_count: Int,
    max_terrain_height: Int,
    min_terrain_height: Int,
  )
}

pub fn generate_chunk(
  position: chunk_position.ChunkPosition,
  options: ChunkGenerationOptions,
) {
  echo "GENERATING CHUNK ("
    <> int.to_string(position.x)
    <> ","
    <> int.to_string(position.z)
    <> ")"
  let block_x = position.x * 16
  let block_z = position.z * 16

  let world_chunk_section_range =
    list.range(
      constant.mc_world_chunk_offset,
      mc_world_chunk_sections_per_chunk + constant.mc_world_chunk_offset - 1,
    )
  let relative_chunk_section_range = list.range(0, 15)

  let empty_chunk_section_array =
    iv.initialise(16 * 16 * 16, fn(_) { block_state.Air })

  list.fold(world_chunk_section_range, [], fn(chunk_sections, chunk_section_y) {
    list.fold(
      relative_chunk_section_range,
      empty_chunk_section_array,
      fn(array, relative_x) {
        let global_x = block_x + relative_x
        list.fold(relative_chunk_section_range, array, fn(array, relative_z) {
          let global_z = block_z + relative_z
          let terrain_y =
            options.min_terrain_height
            + float.truncate(
              calculate_noise(options.seed, global_x, global_z)
              *. int.to_float(
                options.max_terrain_height - options.min_terrain_height,
              ),
            )
          list.fold(relative_chunk_section_range, array, fn(array, relative_y) {
            let global_y = chunk_section_y * 16 + relative_y
            let index = relative_y * 256 + relative_z * 16 + relative_x
            case global_y {
              y if y == terrain_y && y < options.water_level ->
                iv.try_set(array, index, block_state.sand)
              y if y == terrain_y ->
                iv.try_set(array, index, block_state.grass_block)
              y if y < terrain_y -> iv.try_set(array, index, block_state.dirt)
              y if y > terrain_y && y <= options.water_level ->
                iv.try_set(array, index, block_state.water)
              _ -> array
            }
          })
        })
      },
    )
    |> convert_data_to_chunk_section
    |> list.prepend(chunk_sections, _)
  })
  |> list.reverse
  |> chunk.Chunk()
}

pub type WorldGenerationOptions {
  WorldGenerationOptions(
    seed: Float,
    water_level: Int,
    chunk_length: Int,
    max_terrain_height: Int,
    min_terrain_height: Int,
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

pub fn generate(options: WorldGenerationOptions) {
  // The center of a Minecraft world is the intersection of chunk 0,0 & -1,-1
  let world_chunk_min = options.chunk_length / 2 * -1
  let world_chunk_max = options.chunk_length / 2 - 1
  let world_chunk_range = list.range(world_chunk_min, world_chunk_max)
  let world_chunk_section_range =
    list.range(
      constant.mc_world_chunk_offset,
      mc_world_chunk_sections_per_chunk + constant.mc_world_chunk_offset - 1,
    )
  let relative_chunk_section_range = list.range(0, 15)

  let empty_chunk_section_array =
    iv.initialise(16 * 16 * 16, fn(_) { block_state.Air })

  list.fold(world_chunk_range, dict.new(), fn(chunks, chunk_x) {
    list.fold(world_chunk_range, chunks, fn(chunks, chunk_z) {
      list.fold(
        world_chunk_section_range,
        [],
        fn(chunk_sections, chunk_section_y) {
          list.fold(
            relative_chunk_section_range,
            empty_chunk_section_array,
            fn(array, relative_x) {
              let global_x = chunk_x * 16 + relative_x
              list.fold(
                relative_chunk_section_range,
                array,
                fn(array, relative_z) {
                  let global_z = chunk_z * 16 + relative_z
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
                    array,
                    fn(array, relative_y) {
                      let global_y = chunk_section_y * 16 + relative_y
                      let index =
                        relative_y * 256 + relative_z * 16 + relative_x
                      case global_y {
                        y if y == terrain_y && y < options.water_level ->
                          iv.try_set(array, index, block_state.sand)
                        y if y == terrain_y ->
                          iv.try_set(array, index, block_state.grass_block)
                        y if y < terrain_y ->
                          iv.try_set(array, index, block_state.dirt)
                        y if y > terrain_y && y <= options.water_level ->
                          iv.try_set(array, index, block_state.water)
                        _ -> array
                      }
                    },
                  )
                },
              )
            },
          )
          |> convert_data_to_chunk_section
          |> list.prepend(chunk_sections, _)
        },
      )
      |> list.reverse
      |> chunk.Chunk()
      |> dict.insert(chunks, #(chunk_x, chunk_z), _)
    })
  })
  |> dict.merge(get_empty_chunk_outline(world_chunk_min, world_chunk_max))
}

fn convert_data_to_chunk_section(
  data: iv.Array(block_state.BlockState),
) -> chunk_section.ChunkSection {
  chunk_section.ChunkSection(
    ..chunk_section.empty,
    block_count: iv.fold(data, 0, fn(block_count, block_state) {
      case block_state {
        block_state.Air -> block_count
        _ -> block_count + 1
      }
    }),
    block_states: paletted_container.PalettedContainer(
      data: iv.map(data, block_state.to_int) |> iv.to_list,
      palette: chunk_section.direct_block_palette(),
    ),
  )
}

fn get_empty_chunk_outline(world_chunk_min: Int, world_chunk_max: Int) {
  let world_chunk_outline_min = world_chunk_min - 1
  let world_chunk_outline_max = world_chunk_max + 1

  let outline_coordinates =
    list.flatten([
      list.map(
        list.range(world_chunk_outline_min, world_chunk_outline_max),
        fn(x) { #(x, world_chunk_outline_min) },
      ),
      list.map(list.range(world_chunk_min, world_chunk_max), fn(z) {
        #(world_chunk_outline_max, z)
      }),
      list.map(
        list.range(world_chunk_outline_min, world_chunk_outline_max),
        fn(x) { #(x, world_chunk_outline_max) },
      ),
      list.map(list.range(world_chunk_min, world_chunk_max), fn(z) {
        #(world_chunk_outline_min, z)
      }),
    ])

  list.map(outline_coordinates, fn(coordinate) { #(coordinate, chunk.empty()) })
  |> dict.from_list()
}
