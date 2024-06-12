import gleam/bytes_builder.{type BytesBuilder}
import gleam/dict.{type Dict}
import gleam/list
import nbt/encoder
import nbt/tag.{type Nbt, type Tag, Nbt}

pub fn nbt(name: String, tag: Tag) {
  Nbt(name, tag)
}

pub fn byte(byte: BitArray) -> Tag {
  tag.Byte(byte)
}

pub fn boolean(boolean: Bool) -> Tag {
  case boolean {
    True -> tag.Byte(<<1>>)
    False -> tag.Byte(<<0>>)
  }
}

pub fn short(short: Int) -> Tag {
  tag.Short(short)
}

pub fn int(int: Int) -> Tag {
  tag.Int(int)
}

pub fn long(long: Int) -> Tag {
  tag.Long(long)
}

pub fn float(float: Float) -> Tag {
  tag.Float(float)
}

pub fn double(double: Float) -> Tag {
  tag.Double(double)
}

pub fn byte_array(byte_array: BitArray) -> Tag {
  tag.ByteArray(byte_array)
}

pub fn string(string: String) -> Tag {
  tag.String(string)
}

pub fn list(tag: fn(value) -> Tag, list: List(value)) {
  tag.List(list.map(list, tag))
}

pub fn compound(compound: List(#(String, Tag))) -> Tag {
  tag.Compound(dict.from_list(compound))
}

pub fn int_array(int_array: List(Int)) -> Tag {
  tag.IntArray(int_array)
}

pub fn long_array(long_array: List(Int)) -> Tag {
  tag.LongArray(long_array)
}

pub fn encode(nbt: Nbt) {
  encoder.encode(nbt)
}
// pub fn decode(nbt: BitArray) {
//   case decode_tag(nbt) {
//     Ok(tag.Compound(result)) -> Ok(result)
//     _ -> Error(Nil)
//   }
// }

// fn decode_tag(nbt: BitArray) {
//   case nbt {
//     <<0, _rest:bytes>> -> Ok(End)
//     <<1, _rest:bytes>> -> Ok(Byte(<<0>>))
//     <<2, _rest:bytes>> -> Ok(Short(0))
//     <<3, _rest:bytes>> -> Ok(Int(0))
//     <<4, _rest:bytes>> -> Ok(Long(0))
//     <<5, _rest:bytes>> -> Ok(Float(0.0))
//     <<6, _rest:bytes>> -> Ok(Double(0.0))
//     <<7, _rest:bytes>> -> Ok(ByteArray(<<0>>))
//     <<8, _rest:bytes>> -> Ok(String(""))
//     <<9, _rest:bytes>> -> Ok(List([]))
//     <<10, _rest:bytes>> -> Ok(Compound(dict.new()))
//     <<11, _rest:bytes>> -> Ok(IntArray([]))
//     <<12, _rest:bytes>> -> Ok(LongArray([]))
//     _ -> Error(Nil)
//   }
// }
