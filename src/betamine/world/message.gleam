import betamine/common/chunk_position
import betamine/player/message as player_message
import gleam/erlang/process

pub type Message {
  GetChunk(
    return_subject: process.Subject(player_message.PlayerMessage),
    chunk_position: chunk_position.ChunkPosition,
  )
}

pub type Subject =
  process.Subject(Message)

pub type Name =
  process.Name(Message)
