import betamine/protocol/common/chunk/paletted_container.{
  type PalettedContainer, PalettedContainer,
}
import betamine/protocol/encoder
import gleam/bytes_tree.{type BytesTree}

const min_indirect_block_bits_per_entry = 4

const max_indirect_block_bits_per_entry = 8

pub fn indirect_block_palette(ids: List(Int)) {
  paletted_container.IndirectPalette(
    ids,
    min_indirect_block_bits_per_entry,
    max_indirect_block_bits_per_entry,
  )
}

const direct_block_bits_per_entry = 15

pub fn direct_block_palette() {
  paletted_container.DirectPalette(direct_block_bits_per_entry)
}

const min_indirect_biome_bits_per_entry = 1

const max_indirect_biome_bits_per_entry = 3

pub fn indirect_biome_palette(ids: List(Int)) {
  paletted_container.IndirectPalette(
    ids,
    min_indirect_biome_bits_per_entry,
    max_indirect_biome_bits_per_entry,
  )
}

const direct_biome_bits_per_entry = 8

pub fn direct_biome_palette() {
  paletted_container.DirectPalette(direct_biome_bits_per_entry)
}

pub type ChunkSection {
  ChunkSection(
    block_count: Int,
    block_states: PalettedContainer,
    biomes: PalettedContainer,
  )
}

pub const default = ChunkSection(
  block_count: 4096,
  block_states: PalettedContainer(paletted_container.SingleValuedPalette(1), []),
  biomes: PalettedContainer(paletted_container.SingleValuedPalette(0), []),
)

pub const empty = ChunkSection(
  block_count: 0,
  block_states: PalettedContainer(paletted_container.SingleValuedPalette(0), []),
  biomes: PalettedContainer(paletted_container.SingleValuedPalette(0), []),
)

pub fn encode(tree: BytesTree, chunk_section: ChunkSection) {
  tree
  |> encoder.short(chunk_section.block_count)
  |> paletted_container.encode(chunk_section.block_states)
  |> paletted_container.encode(chunk_section.biomes)
}
