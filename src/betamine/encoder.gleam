import betamine/common/position.{type Position}
import betamine/common/velocity.{type Velocity}
import gleam/bit_array
import gleam/bytes_builder.{type BytesBuilder}
import gleam/float
import gleam/int
import gleam/option.{type Option, None, Some}
import gleam/string

pub fn bool(builder: BytesBuilder, bool: Bool) -> BytesBuilder {
  case bool {
    True -> bytes_builder.append(builder, <<1:int-size(8)>>)
    False -> bytes_builder.append(builder, <<0:int-size(8)>>)
  }
}

pub fn var_int(builder: BytesBuilder, int: Int) -> BytesBuilder {
  let clamped_int = int.bitwise_and(int, 0xFFFFFFFF)
  var_int_accumulator(builder, clamped_int)
}

fn var_int_accumulator(builder: BytesBuilder, int: Int) {
  let segment = int.bitwise_and(int, 0b01111111)
  let int = int.bitwise_shift_right(int, 7)
  let segment = case int {
    0 -> segment
    _ -> int.bitwise_or(segment, 0b10000000)
  }
  let builder = bytes_builder.append(builder, <<segment:int-size(8)>>)
  case int {
    0 -> builder
    _ -> var_int_accumulator(builder, int)
  }
}

pub fn string(builder: BytesBuilder, string: String) -> BytesBuilder {
  let builder = var_int(builder, string.length(string))
  bytes_builder.append(builder, <<string:utf8>>)
}

pub fn identifier(
  builder: BytesBuilder,
  identifier: #(String, String),
) -> BytesBuilder {
  string(builder, identifier.0 <> ":" <> identifier.1)
}

pub fn byte(builder: BytesBuilder, int: Int) -> BytesBuilder {
  bytes_builder.append(builder, <<int:int-big-size(8)>>)
}

pub fn short(builder: BytesBuilder, int: Int) -> BytesBuilder {
  bytes_builder.append(builder, <<int:int-size(16)>>)
}

pub fn int(builder: BytesBuilder, int: Int) -> BytesBuilder {
  bytes_builder.append(builder, <<int:int-size(32)>>)
}

pub fn long(builder: BytesBuilder, int: Int) -> BytesBuilder {
  bytes_builder.append(builder, <<int:int-size(64)>>)
}

pub fn float(builder: BytesBuilder, float: Float) -> BytesBuilder {
  bytes_builder.append(builder, <<float:float-size(32)>>)
}

pub fn double(builder: BytesBuilder, float: Float) -> BytesBuilder {
  bytes_builder.append(builder, <<float:float-size(64)>>)
}

pub fn position(builder: BytesBuilder, position: Position) -> BytesBuilder {
  let x = float.truncate(position.x)
  let z = float.truncate(position.z)
  let y = float.truncate(position.y)
  bytes_builder.append(builder, <<
    x:int-size(26),
    z:int-size(26),
    y:int-size(12),
  >>)
}

pub fn angle(builder: BytesBuilder, angle: Float) -> BytesBuilder {
  byte(builder, { angle /. 360.0 *. 256.0 |> float.truncate } % 256)
}

pub fn uuid(builder: BytesBuilder, int: Int) -> BytesBuilder {
  bytes_builder.append(builder, <<int:int-size(128)>>)
}

pub fn raw(builder: BytesBuilder, bit_array: BitArray) {
  bytes_builder.append(builder, bit_array)
}

type Encoder(value) =
  fn(BytesBuilder, value) -> BytesBuilder

pub fn array(
  builder: BytesBuilder,
  list: List(value),
  encoder: Encoder(value),
) -> BytesBuilder {
  case list {
    [first, ..rest] -> {
      let builder = encoder(builder, first)
      array(builder, rest, encoder)
    }
    [] -> builder
  }
}

pub fn byte_array(builder: BytesBuilder, bit_array: BitArray) {
  builder
  |> var_int(bit_array.byte_size(bit_array))
  |> raw(bit_array)
}

pub fn optional(
  builder: BytesBuilder,
  optional: Option(a),
  when_some: fn(BytesBuilder, a) -> BytesBuilder,
) {
  case optional {
    None -> bool(builder, False)
    Some(value) -> {
      bool(builder, True)
      |> when_some(value)
    }
  }
}
