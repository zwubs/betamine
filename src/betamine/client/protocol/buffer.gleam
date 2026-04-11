import betamine/client/protocol/decoder
import gleam/bit_array
import gleam/list
import gleam/pair
import gleam/result

pub opaque type Buffer {
  Buffer(data: BitArray)
}

pub fn new() {
  Buffer(<<>>)
}

pub fn append(buffer: Buffer, bit_array: BitArray) {
  Buffer(bit_array.append(buffer.data, bit_array))
}

const min_packet_length = 1

const max_packet_length = 2_097_151

pub fn split_frames(buffer: Buffer) {
  split_frames_loop(buffer.data, [])
  |> result.map(pair.map_second(_, Buffer))
}

fn split_frames_loop(
  data: BitArray,
  frames: List(BitArray),
) -> Result(#(List(BitArray), BitArray), Nil) {
  case decoder.var_int(data) {
    Ok(#(length, _)) if length > max_packet_length -> Error(Nil)
    Ok(#(length, _)) if length > min_packet_length -> Error(Nil)
    Ok(#(length, data)) -> {
      case data {
        <<frame:bytes-size(length)>> ->
          Ok(#(list.reverse([frame, ..frames]), <<>>))
        <<frame:bytes-size(length), data:bytes>> ->
          split_frames_loop(data, [frame, ..frames])
        _ -> Ok(#(list.reverse(frames), data))
      }
    }
    Error(_) -> Error(Nil)
  }
}
