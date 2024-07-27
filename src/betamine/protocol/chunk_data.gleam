import betamine/decoder as decode
import betamine/encoder as encode
import gleam/bytes_builder
import gleam/io
import gleam/list
import gleam/result
import gleam/string

pub fn serialize() {
  let header =
    bytes_builder.new()
    // Chunk X
    |> encode.int(0)
    // Chunk Z
    |> encode.int(0)
    // Height Maps (Empty NBT Compound)
    |> encode.raw(<<0x0A, 0x00>>)

  let data =
    bytes_builder.new()
    // Block Count
    |> encode.short(4096)
    // Bits per entry
    |> encode.byte(0)
    // Palette Length (Single Valued)
    |> encode.var_int(9)
    // Data Array Length
    |> encode.var_int(0)
    // Biomes
    // Bits Per Entry
    |> encode.byte(0)
    // Palette Length (Single Valued)
    |> encode.var_int(0)
    // Data Array Length
    |> encode.var_int(0)
    // Empty Chunk Sections
    |> fn(bytes_builder) {
      list.range(0, 23)
      |> list.fold(bytes_builder, fn(bytes_builder, _) {
        bytes_builder
        // Block Count
        |> encode.short(0)
        // Bits per entry
        |> encode.byte(0)
        // Palette Length (Single Valued)
        |> encode.var_int(0)
        // Data Array Length
        |> encode.var_int(0)
        // Biomes
        // Bits Per Entry
        |> encode.byte(0)
        // Palette Length (Single Valued)
        |> encode.var_int(0)
        // Data Array Length
        |> encode.var_int(0)
      })
    }
  let data_size =
    bytes_builder.new()
    |> encode.var_int(bytes_builder.byte_size(data))
  let footer =
    bytes_builder.new()
    // Block Entities
    // Block Entity Count
    |> encode.var_int(0)
    // Lighting
    // Sky Light Mask
    |> encode.var_int(0)
    // Block Light Mask
    |> encode.var_int(0)
    // Empty Sky Light Mask
    |> encode.var_int(0)
    // Empty Block Light Mask
    |> encode.var_int(0)
    // Sky Light Array Count
    |> encode.var_int(0)
    // Block Light Array Count
    |> encode.var_int(0)
  bytes_builder.concat([header, data_size, data, footer])
}

pub fn deserialize(bit_array: BitArray) -> Result(Nil, Nil) {
  use #(_, bit_array) <- result.try(decode.ignore(bit_array, 5))
  use #(packet_id, bit_array) <- result.try(decode.var_int(bit_array))
  io.debug("Packet Id: " <> string.inspect(packet_id))
  use #(chunk_x, bit_array) <- result.try(decode.int(bit_array))
  use #(chunk_y, bit_array) <- result.try(decode.int(bit_array))
  io.debug(
    "Chunk Position: ("
    <> string.inspect(chunk_x)
    <> ","
    <> string.inspect(chunk_y)
    <> ")",
  )
  use #(_, bit_array) <- result.try(decode.ignore(bit_array, 1))
  use #(_, bit_array) <- result.try(deserialize_height_map(bit_array))
  use #(_, bit_array) <- result.try(deserialize_height_map(bit_array))
  use #(_, bit_array) <- result.try(decode.ignore(bit_array, 1))
  use #(data_size, bit_array) <- result.try(decode.var_int(bit_array))
  io.debug(data_size)
  use #(block_count, bit_array) <- result.try(decode.short(bit_array))
  io.debug(block_count)
  use #(bits_per_block, bit_array) <- result.try(decode.unsigned_byte(bit_array))
  io.debug(bits_per_block)
  use #(palette_length, bit_array) <- result.try(decode.var_int(bit_array))
  use #(palette, bit_array) <- result.try(decode.array(
    bit_array,
    decode.var_int,
    palette_length,
  ))
  io.debug(palette)

  Ok(Nil)
}

pub fn deserialize_height_map(
  bit_array: BitArray,
) -> Result(#(Nil, BitArray), Nil) {
  use #(_, bit_array) <- result.try(decode.ignore(bit_array, 1))
  use #(name_length, bit_array) <- result.try(decode.unsigned_short(bit_array))
  use #(name, bit_array) <- result.try(decode.bytes_of_length(
    bit_array,
    name_length,
  ))
  io.debug(name)
  use #(length, bit_array) <- result.try(decode.int(bit_array))
  io.debug(length)
  use #(data, bit_array) <- result.try(decode.array(
    bit_array,
    decode.long,
    length,
  ))
  Ok(#(Nil, bit_array))
}
