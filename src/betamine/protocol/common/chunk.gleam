import betamine/common/chunk_position
import betamine/constant.{mc_world_chunk_sections_per_chunk}
import betamine/protocol/common/chunk/chunk_section
import betamine/protocol/encoder
import gleam/bytes_tree
import gleam/list

pub type Chunk {
  Chunk(
    position: chunk_position.ChunkPosition,
    heightmaps: List(Nil),
    sections: List(chunk_section.ChunkSection),
  )
}

pub fn default() {
  Chunk(
    position: chunk_position.default,
    heightmaps: [],
    sections: list.range(0, mc_world_chunk_sections_per_chunk - 1)
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
    position: chunk_position.default,
    heightmaps: [],
    sections: list.range(0, 23) |> list.map(fn(_) { chunk_section.empty }),
  )
}

pub fn encode(tree: bytes_tree.BytesTree, chunk: Chunk) {
  tree
  |> encoder.int(chunk.position.x)
  |> encoder.int(chunk.position.z)
  |> encoder.array(chunk.heightmaps, fn(_, _) { todo as "Encode heightmaps" })
  |> chunk_section.encode_list(chunk.sections)
}
