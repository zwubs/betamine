import betamine/protocol/decoder
import betamine/protocol/encoder
import betamine/protocol/error
import betamine/protocol/packets/clientbound
import betamine/protocol/packets/serverbound
import betamine/protocol/phase
import gleam/bit_array
import gleam/bytes_tree
import gleam/int
import gleam/list
import gleam/result
import gleam/string
import logging

const min_packet_length = 1

const max_packet_length = 2_097_151

pub fn split_frames(
  buffer: BitArray,
) -> Result(#(List(BitArray), BitArray), Nil) {
  logging.log(logging.Debug, "Buffer: " <> bit_array.inspect(buffer))

  split_frame_loop(buffer, [])
}

fn split_frame_loop(
  buffer: BitArray,
  frames: List(BitArray),
) -> Result(#(List(BitArray), BitArray), Nil) {
  logging.log(logging.Debug, "Frames: " <> string.inspect(frames))
  case decoder.var_int(buffer) {
    Ok(#(length, _)) if length > max_packet_length -> Error(Nil)
    Ok(#(length, buffer)) -> {
      case buffer {
        <<frame:bytes-size(length)>> ->
          Ok(#(list.reverse([frame, ..frames]), <<>>))
        <<frame:bytes-size(length), buffer:bytes>> ->
          split_frame_loop(buffer, [frame, ..frames])
        _ -> Ok(#(list.reverse(frames), buffer))
      }
    }
    Error(_) -> Error(Nil)
  }
}

pub fn decode_serverbound(phase: phase.Phase, bit_array: BitArray) {
  use #(id, bit_array) <- result.try(
    decoder.var_int(bit_array)
    |> result.map_error(error.DecodeError(phase, 0, _)),
  )
  case id {
    12 -> Nil
    _ -> logging.log(logging.Debug, "Received Packet: " <> int.to_string(id))
  }
  serverbound.decode(phase, id, bit_array)
}

pub fn encode_clientbound(packet: clientbound.Packet) {
  logging.log(
    logging.Debug,
    "Sending Packet: " <> int.to_string(clientbound.get_packet_id(packet)),
  )
  let tree = clientbound.encode(packet)
  let size =
    bytes_tree.new()
    |> encoder.var_int(bytes_tree.byte_size(tree))
  bytes_tree.prepend_tree(tree, size)
}
