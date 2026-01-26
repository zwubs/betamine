import betamine/constant.{mc_world_chunk_sections_per_chunk}
import betamine/protocol/common/chunk/chunk_section
import betamine/protocol/encoder
import gleam/bytes_tree
import gleam/list

pub type Chunk {
  Chunk(chunk_sections: List(chunk_section.ChunkSection))
}

pub fn default() {
  Chunk(
    chunk_sections: list.range(0, mc_world_chunk_sections_per_chunk - 1)
    |> list.map(fn(index) {
      case index <= 3 {
        True -> chunk_section.default
        False -> chunk_section.empty
      }
    }),
  )
}

pub fn empty() {
  Chunk(
    chunk_sections: list.range(0, 23) |> list.map(fn(_) { chunk_section.empty }),
  )
}

pub fn encode(bytes_tree: bytes_tree.BytesTree, chunk: Chunk) {
  let data =
    bytes_tree.new()
    |> encoder.raw_array(chunk.chunk_sections, chunk_section.encode)
  bytes_tree
  |> encoder.var_int(bytes_tree.byte_size(data))
  |> bytes_tree.append_tree(data)
}
