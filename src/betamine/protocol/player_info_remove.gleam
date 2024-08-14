import betamine/encoder as encode
import gleam/bytes_builder
import gleam/list

pub fn serialize(uuids: List(Int)) {
  bytes_builder.new()
  |> encode.var_int(list.length(uuids))
  |> list.fold(uuids, _, encode.uuid)
}
