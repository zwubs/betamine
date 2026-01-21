import betamine/common/block/block_state
import betamine/constants.{mc_world_chunk_section_height}
import betamine/perlin
import betamine/protocol/common/chunk
import betamine/protocol/common/chunk/chunk_section
import betamine/protocol/common/chunk/paletted_container
import gleam/dict
import gleam/float
import gleam/int
import gleam/list
import gleam/pair
import gleam/result
import iv

const octaves = [#(1.0, -8.0), #(2.0, 16.0), #(8.0, 2.0)]

pub type ChunkGenerationOptions {
  ChunkGenerationOptions(
    seed: Float,
    water_level: Int,
    chunk_section_count: Int,
    max_terrain_height: Int,
    min_terrain_height: Int,
  )
}

pub fn generate_chunk(x: Int, z: Int, options: ChunkGenerationOptions) {
  let block_x = x * 16
  let block_z = z * 16

  let world_chunk_section_range = list.range(0, options.chunk_section_count - 1)
  let relative_chunk_section_range = list.range(0, 15)

  let empty_chunk_section_array =
    iv.initialise(16 * 16 * 16, fn(_) { block_state.Air })

  let summed_amplitude =
    list.fold(octaves, 0.0, fn(sum, octave) { sum +. pair.second(octave) })

  let noise_map =
    list.fold(
      octaves,
      list.map(list.range(0, 255), fn(_) { 0.0 }),
      fn(array, octave) {
        let #(frequency, amplitude) = octave
        list.index_map(array, fn(value, index) {
          let x = int.to_float(index / 16 + block_x) /. 64.0
          let z = int.to_float(index % 16 + block_z) /. 64.0
          value
          +. perlin.noise(x *. frequency, z *. frequency, options.seed)
          *. amplitude
        })
      },
    )
    |> list.index_fold(dict.new(), fn(map, value, index) {
      dict.insert(
        map,
        #(index / 16, index % 16),
        { value /. summed_amplitude +. 1.0 } /. 2.0,
      )
    })

  list.fold(world_chunk_section_range, [], fn(chunk_sections, chunk_section_y) {
    list.fold(
      relative_chunk_section_range,
      empty_chunk_section_array,
      fn(array, relative_x) {
        list.fold(relative_chunk_section_range, array, fn(array, relative_z) {
          let terrain_y =
            dict.get(noise_map, #(relative_x, relative_z))
            |> result.unwrap(0.0)
            |> fn(noise) {
              options.min_terrain_height
              + float.truncate(
                noise
                *. int.to_float(
                  options.max_terrain_height - options.min_terrain_height,
                ),
              )
            }
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

pub fn generate(options: WorldGenerationOptions) {
  let world_chunk_half_length = options.chunk_length / 2
  let world_block_length = options.chunk_length * 16
  let world_block_half_length = world_block_length / 2

  // The center of a Minecraft world is the intersection of chunk 0,0 & -1,-1
  let world_chunk_min = world_chunk_half_length * -1
  let world_chunk_max = world_chunk_half_length - 1
  let world_chunk_range = list.range(world_chunk_min, world_chunk_max)
  let world_chunk_section_range =
    list.range(
      constants.mc_world_chunk_offset,
      mc_world_chunk_section_height + constants.mc_world_chunk_offset - 1,
    )
  let relative_chunk_section_range = list.range(0, 15)

  let empty_chunk_section_array =
    iv.initialise(16 * 16 * 16, fn(_) { block_state.Air })

  let summed_amplitude =
    list.fold(octaves, 0.0, fn(sum, octave) { sum +. pair.second(octave) })

  let global_noise_map =
    list.fold(
      octaves,
      list.range(0, world_block_length * world_block_length - 1)
        |> list.map(fn(_) { 0.0 }),
      fn(array, octave) {
        let #(frequency, amplitude) = octave
        list.index_map(array, fn(value, index) {
          let x =
            int.to_float(index / world_block_length - world_block_half_length)
            /. 128.0
          let z =
            int.to_float(index % world_block_length - world_block_half_length)
            /. 128.0
          value
          +. perlin.noise(x *. frequency, z *. frequency, options.seed)
          *. amplitude
        })
      },
    )
    |> list.index_fold(dict.new(), fn(map, value, index) {
      let global_x = index / world_block_length - world_block_half_length
      let global_z = index % world_block_length - world_block_half_length
      dict.insert(
        map,
        #(global_x, global_z),
        { value /. summed_amplitude +. 1.0 } /. 2.0,
      )
    })
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
                    dict.get(global_noise_map, #(global_x, global_z))
                    |> result.unwrap(0.0)
                    |> fn(noise) {
                      options.min_terrain_height
                      + float.truncate(
                        noise
                        *. int.to_float(
                          options.max_terrain_height
                          - options.min_terrain_height,
                        ),
                      )
                    }
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
