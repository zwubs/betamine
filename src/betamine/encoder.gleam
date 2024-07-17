import gleam/bytes_builder.{type BytesBuilder}
import gleam/string

@external(erlang, "eleb128_ffi", "unsigned_encode")
pub fn signed_encode(int: Int) -> BitArray

pub fn bool(builder: BytesBuilder, bool: Bool) -> BytesBuilder {
  case bool {
    True -> bytes_builder.append(builder, <<1:int-size(8)>>)
    False -> bytes_builder.append(builder, <<0:int-size(8)>>)
  }
}

pub fn byte(builder: BytesBuilder, byte: Int) -> BytesBuilder {
  bytes_builder.append(builder, <<byte:int-big-size(8)>>)
}

pub fn var_int(builder: BytesBuilder, int: Int) -> BytesBuilder {
  bytes_builder.append(builder, signed_encode(int))
}

pub fn string(builder: BytesBuilder, string: String) -> BytesBuilder {
  let builder = var_int(builder, string.length(string))
  bytes_builder.append(builder, <<string:utf8>>)
}

pub fn identifier(
  builder: BytesBuilder,
  namespace: String,
  value: String,
) -> BytesBuilder {
  string(builder, namespace <> ":" <> value)
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

pub fn uuid(builder: BytesBuilder, int: Int) -> BytesBuilder {
  bytes_builder.append(builder, <<int:int-size(128)>>)
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
