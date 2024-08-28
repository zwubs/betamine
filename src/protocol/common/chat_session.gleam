import betamine/encoder
import gleam/bytes_builder.{type BytesBuilder}

pub type ChatSession {
  ChatSession(
    id: Int,
    expires: Int,
    encoded_public_key: BitArray,
    public_key_signature: BitArray,
  )
}

pub fn encode(builder: BytesBuilder, session: ChatSession) {
  builder
  |> encoder.uuid(session.id)
  |> encoder.long(session.expires)
  |> encoder.byte_array(session.encoded_public_key)
  |> encoder.byte_array(session.public_key_signature)
}
