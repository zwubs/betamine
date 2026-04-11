import betamine/common/block/block_state
import betamine/common/block_position
import betamine/common/identifier
import betamine/common/math/vector3.{type Vector3}
import gleam/bit_array
import gleam/bytes_tree
import gleam/float
import gleam/int
import gleam/json
import gleam/list
import gleam/option.{type Option, None, Some}
import gleam/string
import nbeet/nbt

pub fn bool(bool: Bool) -> BitArray {
  case bool {
    True -> <<1:int-size(8)>>
    False -> <<0:int-size(8)>>
  }
}

pub fn var_int(int: Int) -> BitArray {
  let clamped_int = int.bitwise_and(int, 0xFFFFFFFF)
  var_int_accumulator(<<>>, clamped_int)
}

pub fn var_long(int: Int) -> BitArray {
  let clamped_int = int.bitwise_and(int, 0xFFFFFFFFFFFFFFFF)
  var_int_accumulator(<<>>, clamped_int)
}

fn var_int_accumulator(bit_array: BitArray, int: Int) {
  let segment = int.bitwise_and(int, 0b01111111)
  let int = int.bitwise_shift_right(int, 7)
  let segment = case int {
    0 -> segment
    _ -> int.bitwise_or(segment, 0b10000000)
  }
  let tree = bit_array.append(bit_array, <<segment:int-size(8)>>)
  case int {
    0 -> tree
    _ -> var_int_accumulator(tree, int)
  }
}

pub fn string(string: String) -> BitArray {
  var_int(string.length(string))
  |> bit_array.append(<<string:utf8>>)
}

pub fn byte(int: Int) -> BitArray {
  <<int:int-big-size(8)>>
}

pub fn short(int: Int) -> BitArray {
  <<int:int-size(16)>>
}

pub fn int(int: Int) -> BitArray {
  <<int:int-size(32)>>
}

pub fn long(int: Int) -> BitArray {
  <<int:int-size(64)>>
}

pub fn float(float: Float) -> BitArray {
  <<float:float-size(32)>>
}

pub fn double(float: Float) -> BitArray {
  <<float:float-size(64)>>
}

pub fn position(position: Vector3(Int)) -> BitArray {
  block_position.to_bit_array(position)
}

pub fn angle(angle: Float) -> BitArray {
  byte({ angle /. 360.0 *. 256.0 |> float.truncate } % 256)
}

pub fn identifier(identifier: identifier.Identifier) -> BitArray {
  string(identifier.to_string(identifier))
}

pub fn raw_array(list: List(value), encoder: fn(value) -> BitArray) -> BitArray {
  raw_array_loop(bytes_tree.new(), list, encoder) |> bytes_tree.to_bit_array()
}

fn raw_array_loop(
  tree: bytes_tree.BytesTree,
  list: List(value),
  encoder: fn(value) -> BitArray,
) -> bytes_tree.BytesTree {
  case list {
    [first, ..rest] ->
      encoder(first)
      |> bytes_tree.append(tree, _)
      |> raw_array_loop(rest, encoder)
    [] -> tree
  }
}

/// Encodes a length prefixed array
pub fn array(list: List(value), encoder: fn(value) -> BitArray) -> BitArray {
  bytes_tree.new()
  |> bytes_tree.append(var_int(list.length(list)))
  |> raw_array_loop(list, encoder)
  |> bytes_tree.to_bit_array()
}

pub fn byte_array(bit_array: BitArray) {
  bit_array.append(var_int(bit_array.byte_size(bit_array)), bit_array)
}

pub fn optional(optional: Option(a), when_some: fn(a) -> BitArray) -> BitArray {
  case optional {
    None -> bool(False)
    Some(value) -> {
      bit_array.append(bool(True), when_some(value))
    }
  }
}

pub fn bitmask(bitmask: List(Bool)) {
  bitmask_to_int(list.reverse(bitmask), 0) |> byte()
}

fn bitmask_to_int(bitmask: List(Bool), accumulator: Int) {
  case bitmask {
    [bool, ..bitmask] -> {
      let bit = case bool {
        True -> 1
        False -> 0
      }
      bitmask_to_int(bitmask, int.bitwise_shift_left(accumulator, 1) + bit)
    }
    [] -> int.bitwise_and(accumulator, 0b111111111)
  }
}

pub fn block_state(block_state: block_state.BlockState) {
  var_int(block_state.to_int(block_state))
}

pub fn nbt(nbt: nbt.Nbt) {
  nbt.java_network_encode(nbt)
}

pub fn nbt_tag(tag: nbt.Tag) {
  nbt.encode_tag(tag)
}

pub fn json(json: json.Json) {
  string(json.to_string(json))
}
