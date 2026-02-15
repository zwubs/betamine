import betamine/common/profile
import betamine/common/uuid
import betamine/player/message as player_message
import betamine/session/message as session_message
import gleam/erlang/process
import gleam/otp/actor

pub type SessionCommand {
  New(
    return_subject: process.Subject(
      Result(
        #(process.Subject(player_message.SessionCommand), profile.Profile),
        actor.StartError,
      ),
    ),
    uuid: uuid.Uuid,
    session_subject: process.Subject(session_message.PlayerEvent),
  )
  GetAll(return_subject: process.Subject(List(#(uuid.Uuid, String))))
}
