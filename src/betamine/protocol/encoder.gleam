import betamine/common/block/block_state
import betamine/common/block_position
import betamine/common/identifier
import betamine/common/math/vector3.{type Vector3}
import gleam/bit_array
import gleam/bytes_tree.{type BytesTree}
import gleam/float
import gleam/int
import gleam/json
import gleam/list
import gleam/option.{type Option, None, Some}
import gleam/string
import nbeet

pub fn bool(tree: BytesTree, bool: Bool) -> BytesTree {
  case bool {
    True -> bytes_tree.append(tree, <<1:int-size(8)>>)
    False -> bytes_tree.append(tree, <<0:int-size(8)>>)
  }
}

pub fn var_int(tree: BytesTree, int: Int) -> BytesTree {
  let clamped_int = int.bitwise_and(int, 0xFFFFFFFF)
  var_int_accumulator(tree, clamped_int)
}

pub fn var_long(tree: BytesTree, int: Int) -> BytesTree {
  let clamped_int = int.bitwise_and(int, 0xFFFFFFFFFFFFFFFF)
  var_int_accumulator(tree, clamped_int)
}

fn var_int_accumulator(tree: BytesTree, int: Int) {
  let segment = int.bitwise_and(int, 0b01111111)
  let int = int.bitwise_shift_right(int, 7)
  let segment = case int {
    0 -> segment
    _ -> int.bitwise_or(segment, 0b10000000)
  }
  let tree = bytes_tree.append(tree, <<segment:int-size(8)>>)
  case int {
    0 -> tree
    _ -> var_int_accumulator(tree, int)
  }
}

pub fn string(tree: BytesTree, string: String) -> BytesTree {
  let tree = var_int(tree, string.length(string))
  bytes_tree.append(tree, <<string:utf8>>)
}

pub fn byte(tree: BytesTree, int: Int) -> BytesTree {
  bytes_tree.append(tree, <<int:int-big-size(8)>>)
}

pub fn short(tree: BytesTree, int: Int) -> BytesTree {
  bytes_tree.append(tree, <<int:int-size(16)>>)
}

pub fn int(tree: BytesTree, int: Int) -> BytesTree {
  bytes_tree.append(tree, <<int:int-size(32)>>)
}

pub fn long(tree: BytesTree, int: Int) -> BytesTree {
  bytes_tree.append(tree, <<int:int-size(64)>>)
}

pub fn float(tree: BytesTree, float: Float) -> BytesTree {
  bytes_tree.append(tree, <<float:float-size(32)>>)
}

pub fn double(tree: BytesTree, float: Float) -> BytesTree {
  bytes_tree.append(tree, <<float:float-size(64)>>)
}

pub fn position(tree: BytesTree, position: Vector3(Int)) -> BytesTree {
  bytes_tree.append(tree, block_position.to_bit_array(position))
}

pub fn angle(tree: BytesTree, angle: Float) -> BytesTree {
  byte(tree, { angle /. 360.0 *. 256.0 |> float.truncate } % 256)
}

pub fn identifier(tree: BytesTree, identifier: identifier.Identifier) {
  string(tree, identifier.to_string(identifier))
}

pub fn raw(tree: BytesTree, bit_array: BitArray) {
  bytes_tree.append(tree, bit_array)
}

type Encoder(value) =
  fn(BytesTree, value) -> BytesTree

pub fn raw_array(tree: BytesTree, list: List(value), encoder: Encoder(value)) {
  case list {
    [first, ..rest] -> encoder(tree, first) |> raw_array(rest, encoder)
    [] -> tree
  }
}

/// Encodes a length prefixed array
pub fn array(
  tree: BytesTree,
  list: List(value),
  encoder: Encoder(value),
) -> BytesTree {
  var_int(tree, list.length(list))
  |> raw_array(list, encoder)
}

pub fn byte_array(tree: BytesTree, bit_array: BitArray) {
  tree
  |> var_int(bit_array.byte_size(bit_array))
  |> raw(bit_array)
}

pub fn optional(
  tree: BytesTree,
  optional: Option(a),
  when_some: fn(BytesTree, a) -> BytesTree,
) {
  case optional {
    None -> bool(tree, False)
    Some(value) -> {
      bool(tree, True)
      |> when_some(value)
    }
  }
}

pub fn bitmask(tree: BytesTree, bitmask: List(Bool)) {
  bitmask_to_int(list.reverse(bitmask), 0) |> byte(tree, _)
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

pub fn block_state(tree: BytesTree, block_state: block_state.BlockState) {
  tree |> var_int(block_state.to_int(block_state))
}

pub fn nbt(tree: BytesTree, nbt: nbeet.Nbt) {
  let assert Ok(bit_array) = nbeet.java_network_encode(nbt)
  bytes_tree.append(tree, bit_array)
}

pub fn json(tree: BytesTree, json: json.Json) {
  tree |> string(json.to_string(json))
}
