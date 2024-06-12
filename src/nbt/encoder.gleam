import gleam/bit_array
import gleam/bytes_builder
import gleam/dict.{type Dict}
import gleam/io
import gleam/list
import gleam/string
import nbt/tag.{type Nbt, type Tag}
import nbt/type_id

pub fn encode(nbt: Nbt) {
  encode_root_compound(nbt.name, nbt.tag)
}

fn encode_root_compound(name: String, tag: Tag) {
  case tag {
    tag.Compound(compound) -> {
      let name = encode_string(name)
      let encoded_compound = encode_compound(compound)
      Ok(<<type_id.compound:bits, name:bits, encoded_compound:bits>>)
    }
    _ -> Error(Nil)
  }
}

fn encode_tag(tag: Tag) {
  case tag {
    tag.End -> <<>>
    tag.Byte(byte) -> encode_byte(byte)
    tag.Short(short) -> encode_short(short)
    tag.Int(int) -> encode_int(int)
    tag.Long(long) -> encode_long(long)
    tag.Float(float) -> encode_float(float)
    tag.Double(double) -> encode_double(double)
    tag.ByteArray(byte_array) -> encode_byte_array(byte_array)
    tag.String(string) -> encode_string(string)
    tag.List(list) -> encode_list(list)
    tag.Compound(compound) -> encode_compound(compound)
    tag.IntArray(int_array) -> encode_int_array(int_array)
    tag.LongArray(long_array) -> encode_long_array(long_array)
  }
}

fn encode_byte(byte: BitArray) {
  let encoded = <<byte:bits-size(8)>>
  io.debug(bit_array.inspect(encoded))
  encoded
}

fn encode_short(short: Int) {
  <<short:size(16)>>
}

fn encode_int(int: Int) {
  <<int:size(32)>>
}

fn encode_long(long: Int) {
  <<long:size(64)>>
}

fn encode_float(float: Float) {
  <<float:float-size(32)>>
}

fn encode_double(double: Float) {
  <<double:float-size(32)>>
}

fn encode_byte_array(byte_array: BitArray) {
  let length = bit_array.byte_size(byte_array)
  <<length:size(32), byte_array:bits>>
}

fn encode_string(string: String) {
  let length = string.length(string)
  <<length:size(16), string:utf8>>
}

fn encode_list(list: List(Tag)) {
  case list {
    [first_tag, ..] -> {
      let type_id = type_id.from_tag(first_tag)
      let length = list.length(list)
      let encoded_tags =
        list.fold(list, <<>>, fn(bit_array, tag) {
          bit_array.append(bit_array, encode_tag(tag))
        })
      <<type_id:bits, length:size(32), encoded_tags:bits, type_id.end:bits>>
    }
    _ -> <<type_id.end:bits, 0:size(32)>>
  }
}

// Implements sorting to make unit testing viable since
// the order of elements in a dict is not garunteed.
fn encode_compound(compound: Dict(String, Tag)) {
  compound
  |> dict.to_list
  |> list.sort(fn(a, b) { string.compare(a.0, b.0) })
  |> list.fold(bytes_builder.new(), fn(builder, element) {
    let #(name, tag) = element
    let type_id = type_id.from_tag(tag)
    let name = encode_string(name)
    let encoded_tag = encode_tag(tag)
    builder
    |> bytes_builder.append(type_id)
    |> bytes_builder.append(name)
    |> bytes_builder.append(encoded_tag)
  })
  |> bytes_builder.append(type_id.end)
  |> bytes_builder.to_bit_array
}

fn encode_int_array(int_array: List(Int)) {
  let length = list.length(int_array)
  let encoded_ints =
    list.fold(int_array, <<>>, fn(bit_array, tag) {
      bit_array.append(bit_array, encode_int(tag))
    })
  <<length:size(32), encoded_ints:bits>>
}

fn encode_long_array(long_array: List(Int)) {
  let length = list.length(long_array)
  let encoded_ints =
    list.fold(long_array, <<>>, fn(bit_array, tag) {
      bit_array.append(bit_array, encode_long(tag))
    })
  <<length:size(32), encoded_ints:bits>>
}
