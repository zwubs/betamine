import gleam/bit_array
import gleam/int
import gleam/io
import gleam/result.{map, try}

type DecodeResult(value) =
  Result(#(value, BitArray), Nil)

@external(erlang, "erlang", "bit_size")
pub fn bit_size(x: BitArray) -> Int

const int32_mask = 0xFFFFFFFF

pub fn var_int(bit_array: BitArray) -> DecodeResult(Int) {
  use #(int, bit_array) <- result.then(var_int_accumulator(bit_array, 0, 0))
  let most_significant_bit = int.bitwise_shift_right(int, 31)
  let signed_int = case most_significant_bit {
    1 -> { int.bitwise_exclusive_or(int, int32_mask) + 1 } * -1
    _ -> int
  }
  Ok(#(signed_int, bit_array))
}

fn var_int_accumulator(
  bit_array: BitArray,
  accumulated_int: Int,
  iteration: Int,
) -> DecodeResult(Int) {
  case bit_array {
    <<most_significant_bit:int-size(1), int:int-size(7), bit_array:bytes>> -> {
      let accumulated_int =
        int.bitwise_or(
          accumulated_int,
          int.bitwise_shift_left(int, 7 * iteration),
        )
      case most_significant_bit {
        1 -> var_int_accumulator(bit_array, accumulated_int, iteration + 1)
        _ -> Ok(#(int.bitwise_and(int32_mask, accumulated_int), bit_array))
      }
    }
    _ -> Error(Nil)
  }
}

pub fn ignore(bit_array: BitArray, byte_count: Int) -> DecodeResult(Nil) {
  case bit_array {
    <<_:bytes-size(byte_count), bit_array:bytes>> -> Ok(#(Nil, bit_array))
    _ -> Error(Nil)
  }
}

pub fn bytes_of_length(
  bit_array: BitArray,
  length: Int,
) -> DecodeResult(BitArray) {
  case bit_array {
    <<bytes:bytes-size(length), bit_array:bytes>> -> Ok(#(bytes, bit_array))
    _ -> Error(Nil)
  }
}

pub fn string(bit_array: BitArray) -> DecodeResult(String) {
  use #(length, bit_array) <- try(var_int(bit_array))
  use #(bytes, bit_array) <- try(bytes_of_length(bit_array, length))
  use string <- map(string_from_bytes(bytes))
  #(string, bit_array)
}

fn string_from_bytes(bytes: BitArray) {
  bit_array.to_string(bytes)
  |> result.replace_error(Nil)
}

pub fn short(bit_array: BitArray) {
  case bit_array {
    <<bytes:int-size(16), bit_array:bytes>> -> Ok(#(bytes, bit_array))
    _ -> Error(Nil)
  }
}

pub fn unsigned_short(bit_array: BitArray) {
  case bit_array {
    <<bytes:int-unsigned-size(16), bit_array:bytes>> -> Ok(#(bytes, bit_array))
    _ -> Error(Nil)
  }
}

pub fn int(bit_array: BitArray) {
  case bit_array {
    <<bytes:int-signed-size(32), bit_array:bytes>> -> Ok(#(bytes, bit_array))
    _ -> Error(Nil)
  }
}

pub fn long(bit_array: BitArray) {
  case bit_array {
    <<bytes:int-signed-size(64), bit_array:bytes>> -> Ok(#(bytes, bit_array))
    _ -> Error(Nil)
  }
}

pub fn uuid(bit_array: BitArray) {
  case bit_array {
    <<bytes:int-unsigned-size(128), bit_array:bytes>> -> Ok(#(bytes, bit_array))
    _ -> Error(Nil)
  }
}

pub fn byte(bit_array: BitArray) {
  case bit_array {
    <<byte:int-signed, bit_array:bytes>> -> Ok(#(byte, bit_array))
    _ -> Error(Nil)
  }
}

pub fn unsigned_byte(bit_array: BitArray) {
  case bit_array {
    <<byte:int-unsigned, bit_array:bytes>> -> Ok(#(byte, bit_array))
    _ -> Error(Nil)
  }
}

pub fn boolean(bit_array: BitArray) {
  case bit_array {
    <<bool:int, bit_array:bytes>> -> {
      case bool {
        0 -> Ok(#(False, bit_array))
        1 -> Ok(#(True, bit_array))
        _ -> Error(Nil)
      }
    }
    _ -> Error(Nil)
  }
}

pub fn float(bit_array: BitArray) {
  case bit_array {
    <<bytes:float-size(32), bit_array:bytes>> -> Ok(#(bytes, bit_array))
    _ -> Error(Nil)
  }
}

pub fn double(bit_array: BitArray) {
  case bit_array {
    <<bytes:float-size(64), bit_array:bytes>> -> Ok(#(bytes, bit_array))
    _ -> Error(Nil)
  }
}

type DecodeArrayResult(value, error) =
  Result(#(List(value), BitArray), error)

type ArrayParser(value, error) =
  fn(BitArray) -> Result(#(value, BitArray), error)

pub fn array(
  bit_array: BitArray,
  parser: ArrayParser(value, Nil),
  length: Int,
) -> DecodeArrayResult(value, Nil) {
  array_elements(bit_array, parser, [], length)
}

fn array_elements(
  bit_array: BitArray,
  parser: ArrayParser(value, error),
  values: List(value),
  length: Int,
) -> DecodeArrayResult(value, error) {
  case length {
    l if l < 1 -> Ok(#(values, bit_array))
    _ -> {
      use #(value, bit_array) <- try(parser(bit_array))
      array_elements(bit_array, parser, [value, ..values], length - 1)
    }
  }
}
