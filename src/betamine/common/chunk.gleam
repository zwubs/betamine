import betamine/protocol/encoder
import gleam/bytes_tree.{type BytesTree}
import gleam/float
import gleam/int
import gleam/list
import gleam/result

pub fn default_chunk() {
  [
    default_empty_chunk_section,
    default_empty_chunk_section,
    default_empty_chunk_section,
    default_direct_chunk_section(),
    default_empty_chunk_section,
    default_empty_chunk_section,
    default_empty_chunk_section,
    default_empty_chunk_section,
    default_empty_chunk_section,
    default_empty_chunk_section,
    default_empty_chunk_section,
    default_empty_chunk_section,
    default_empty_chunk_section,
    default_empty_chunk_section,
    default_empty_chunk_section,
    default_empty_chunk_section,
    default_empty_chunk_section,
    default_empty_chunk_section,
    default_empty_chunk_section,
    default_empty_chunk_section,
    default_empty_chunk_section,
    default_empty_chunk_section,
    default_empty_chunk_section,
    default_empty_chunk_section,
  ]
}

pub type ChunkSection {
  ChunkSection(
    block_count: Int,
    block_states: PalettedContainer,
    biomes: PalettedContainer,
  )
}

pub const default_chunk_section = ChunkSection(
  block_count: 4096,
  block_states: PalettedContainer(SingleValued(1), []),
  biomes: PalettedContainer(SingleValued(0), []),
)

pub fn default_direct_chunk_section() {
  ChunkSection(
    block_count: 4096,
    block_states: PalettedContainer(
      Direct,
      list.append(
        list.range(1, { 4096 - 256 }) |> list.map(fn(_) { 0 }),
        list.range(1, 256),
      ),
    ),
    biomes: PalettedContainer(SingleValued(0), []),
  )
}

pub fn default_indirect_chunk_section() {
  ChunkSection(
    block_count: 4096,
    block_states: PalettedContainer(
      Indirect([0, 1, 15]),
      list.append(
        list.range(1, { 4096 - 256 }) |> list.map(fn(_) { 0 }),
        list.range(1, 256) |> list.index_map(fn(_, index) { index % 2 + 1 }),
      ),
    ),
    biomes: PalettedContainer(SingleValued(0), []),
  )
}

pub const default_empty_chunk_section = ChunkSection(
  block_count: 0,
  block_states: PalettedContainer(SingleValued(0), []),
  biomes: PalettedContainer(SingleValued(0), []),
)

pub fn encode_section(tree: BytesTree, section: ChunkSection) {
  tree
  |> encoder.short(section.block_count)
  |> encode_paletted_container(section.block_states)
  |> encode_paletted_container(section.biomes)
}

pub type PalettedContainer {
  PalettedContainer(palette: Palette, data: List(Int))
}

pub type Palette {
  SingleValued(id: Int)
  Indirect(ids: List(Int))
  Direct
}

const bits_per_long = 64

const bits_per_direct_entry = 15

const min_bits_per_indirect_entry = 4

const max_bits_per_indirect_entry = 8

fn encode_paletted_container(
  tree: BytesTree,
  paletted_container: PalettedContainer,
) {
  let PalettedContainer(palette:, data:) = paletted_container
  case palette {
    SingleValued(id) -> {
      tree
      |> encoder.byte(0)
      |> encoder.var_int(id)
      |> encoder.var_int(0)
    }
    Indirect(palette) -> {
      let bits_per_indirect_entry =
        int.clamp(
          float.truncate(result.unwrap(
            int.power(2, int.to_float(list.length(palette))),
            0.0,
          )),
          min_bits_per_indirect_entry,
          max_bits_per_indirect_entry,
        )
      tree
      |> encoder.byte(bits_per_indirect_entry)
      |> encoder.array(palette, encoder.var_int)
      |> encoder.array(
        pack_data(data, bits_per_indirect_entry, []),
        encoder.long,
      )
    }
    Direct -> {
      tree
      |> encoder.byte(bits_per_direct_entry)
      |> encoder.array(pack_data(data, bits_per_direct_entry, []), encoder.long)
    }
  }
}

fn pack_data(entries: List(Int), bits_per_entry: Int, accumulator: List(Int)) {
  let ids_per_long = bits_per_long / bits_per_entry
  let #(entries_to_combine, entries) = list.split(entries, ids_per_long)
  case entries_to_combine {
    [] -> list.reverse(accumulator)
    _ ->
      pack_data(entries, bits_per_entry, [
        pack_ints(list.reverse(entries_to_combine), bits_per_entry, 0),
        ..accumulator
      ])
  }
}

fn pack_ints(ints: List(Int), bits_per_int: Int, accumulator: Int) {
  case ints {
    [] -> accumulator
    [entry, ..entries] -> {
      { int.bitwise_shift_left(accumulator, bits_per_int) + entry }
      |> pack_ints(entries, bits_per_int, _)
    }
  }
}
