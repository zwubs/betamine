import betamine/encoder as encode
import gleam/bytes_builder
import gleam/list

pub fn serialize(entity_ids: List(Int)) {
  bytes_builder.new()
  |> encode.var_int(list.length(entity_ids))
  |> list.fold(entity_ids, _, encode.var_int)
}
