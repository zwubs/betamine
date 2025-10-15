import betamine/common/block/block_state
import betamine/constants.{mc_world_chunk_length, mc_world_chunk_section_height}
import betamine/protocol/common/chunk
import betamine/protocol/common/chunk/chunk_section
import betamine/protocol/common/chunk/paletted_container
import betamine/protocol/packets/clientbound
import gleam/dict
import gleam/float
import gleam/int
import gleam/list
import gleam/result
import gleam_community/maths
import iv

pub fn generate() {
  let world_chunk_half_length = mc_world_chunk_length / 2
  let world_chunk_range =
    list.range({ world_chunk_half_length * -1 }, world_chunk_half_length - 1)
  let world_chunk_section_range =
    list.range(0, mc_world_chunk_section_height - 1)
  let block_range = list.range(0, 15)

  let empty_data = iv.initialise(16 * 16 * 16, fn(_) { block_state.Air })

  list.fold(world_chunk_range, dict.new(), fn(chunks, chunk_x) {
    list.fold(world_chunk_range, chunks, fn(chunks, chunk_z) {
      list.fold(
        world_chunk_section_range,
        [],
        fn(chunk_sections, chunk_section_y) {
          list.fold(block_range, empty_data, fn(array, relative_x) {
            let global_x = chunk_x * 16 + relative_x
            list.fold(block_range, array, fn(array, relative_z) {
              let global_z = chunk_z * 16 + relative_z
              let terrain_y =
                float.truncate(
                  maths.sin(int.to_float(global_x) /. 16.0)
                  *. maths.sin(int.to_float(global_z) /. 16.0)
                  *. 8.0,
                )
              list.fold(block_range, array, fn(array, relative_y) {
                let global_y = { chunk_section_y - 4 } * 16 + relative_y
                let index = relative_y * 256 + relative_z * 16 + relative_x
                case global_y {
                  y if y == terrain_y ->
                    result.unwrap(
                      iv.set(array, index, block_state.GrassBlock),
                      array,
                    )
                  y if y < terrain_y ->
                    result.unwrap(iv.set(array, index, block_state.Dirt), array)
                  _ -> array
                }
              })
            })
          })
          |> convert_data_to_chunk_section
          |> list.prepend(chunk_sections, _)
        },
      )
      |> list.reverse
      |> chunk.Chunk()
      |> dict.insert(chunks, #(chunk_x, chunk_z), _)
    })
  })
  |> dict.to_list
  |> list.map(fn(data) {
    let #(#(x, z), chunk) = data
    clientbound.LevelChunkWithLight(
      clientbound.LevelChunkWithLightPacket(
        ..clientbound.default_level_chunk_with_light_packet(),
        x:,
        z:,
        chunk:,
      ),
    )
  })
}

fn convert_data_to_chunk_section(
  data: iv.Array(block_state.BlockState),
) -> chunk_section.ChunkSection {
  chunk_section.ChunkSection(
    ..chunk_section.empty,
    block_count: 256,
    block_states: paletted_container.PalettedContainer(
      data: iv.map(data, block_state.to_int) |> iv.to_list,
      palette: chunk_section.direct_block_palette(),
    ),
  )
}
