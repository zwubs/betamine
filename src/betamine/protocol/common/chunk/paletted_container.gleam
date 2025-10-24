import betamine/protocol/encoder
import gleam/bytes_tree
import gleam/float
import gleam/int
import gleam/list
import gleam/result

const bits_per_long = 64

pub type PalettedContainer {
  PalettedContainer(palette: Palette, data: List(Int))
}

pub type Palette {
  SingleValuedPalette(id: Int)
  IndirectPalette(
    ids: List(Int),
    min_bits_per_entry: Int,
    max_bits_per_entry: Int,
  )
  DirectPalette(bits_per_entry: Int)
}

pub fn encode(tree: bytes_tree.BytesTree, paletted_container: PalettedContainer) {
  let PalettedContainer(palette:, data:) = paletted_container
  case palette {
    SingleValuedPalette(id) -> {
      tree
      |> encoder.byte(0)
      |> encoder.var_int(id)
    }
    IndirectPalette(palette, min_bit_count, max_bit_count) -> {
      let bits_per_indirect_entry =
        int.clamp(
          float.truncate(result.unwrap(
            int.power(2, int.to_float(list.length(palette))),
            0.0,
          )),
          min_bit_count,
          max_bit_count,
        )
      tree
      |> encoder.byte(bits_per_indirect_entry)
      |> encoder.array(palette, encoder.var_int)
      |> encoder.raw_array(
        pack_data(data, bits_per_indirect_entry, []),
        encoder.long,
      )
    }
    DirectPalette(bits_per_entry:) -> {
      tree
      |> encoder.byte(bits_per_entry)
      |> encoder.raw_array(pack_data(data, bits_per_entry, []), encoder.long)
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
