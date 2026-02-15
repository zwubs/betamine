import betamine/common/chunk_position
import betamine/player/message as player_message
import gleam/erlang/process

pub type PlayerCommand {
  GetChunk(
    return_subject: process.Subject(player_message.WorldEvent),
    chunk_position: chunk_position.ChunkPosition,
  )
}
