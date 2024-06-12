import gleam/bytes_builder.{type BytesBuilder}
import gleam/string

@external(erlang, "eleb128_ffi", "signed_encode")
pub fn signed_encode(int: Int) -> BitArray

pub fn var_int(builder: BytesBuilder, int: Int) -> BytesBuilder {
  bytes_builder.append(builder, signed_encode(int))
}

pub fn string(builder: BytesBuilder, string: String) -> BytesBuilder {
  let builder = var_int(builder, string.length(string))
  bytes_builder.append(builder, <<string:utf8>>)
}

pub fn long(builder: BytesBuilder, int: Int) -> BytesBuilder {
  bytes_builder.append(builder, <<int:int-size(64)>>)
}

pub fn uuid(builder: BytesBuilder, int: Int) -> BytesBuilder {
  bytes_builder.append(builder, <<int:int-size(128)>>)
}
