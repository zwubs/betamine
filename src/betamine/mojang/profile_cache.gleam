//// The profile cache is responsible for fetching player profiles from Mojang's servers.
//// It also handles caching these profiles to improve performance.

import betamine/common/profile
import betamine/common/uuid
import betamine/constant.{mojang_base_profile_host, mojang_base_profile_path}
import gleam/dict
import gleam/erlang/process
import gleam/http/request
import gleam/http/response
import gleam/httpc
import gleam/json
import gleam/otp/actor
import gleam/otp/supervision
import gleam/string
import logging

pub type Message {
  GetProfile(
    return_subject: process.Subject(Result(profile.Profile, Nil)),
    uuid: uuid.Uuid,
  )
}

pub type Subject =
  process.Subject(Message)

pub type Name =
  process.Name(Message)

type State {
  State(profiles: dict.Dict(uuid.Uuid, profile.Profile))
}

pub fn supervised(name: Name) -> supervision.ChildSpecification(Subject) {
  supervision.worker(fn() { start(name) })
}

pub fn start(name: Name) -> Result(actor.Started(Subject), actor.StartError) {
  actor.new_with_initialiser(1000, fn(subject) {
    actor.initialised(State(dict.new()))
    |> actor.selecting(process.select(process.new_selector(), subject))
    |> actor.returning(subject)
    |> Ok
  })
  |> actor.on_message(handle_message)
  |> actor.named(name)
  |> actor.start()
}

fn handle_message(state: State, message: Message) -> actor.Next(State, Message) {
  case message {
    GetProfile(return_subject:, uuid:) -> {
      case dict.get(state.profiles, uuid) {
        Ok(profile) -> {
          process.send(return_subject, Ok(profile))
          state
        }
        Error(_) ->
          case fetch_profile(uuid) {
            Ok(profile) -> {
              process.send(return_subject, Ok(profile))
              let profiles = dict.insert(state.profiles, uuid, profile)
              State(profiles:)
            }
            Error(reason) -> {
              logging.log(
                logging.Error,
                "Failed to fetch profile for "
                  <> uuid.to_string(uuid)
                  <> ":\n  "
                  <> reason,
              )
              process.send(return_subject, Error(Nil))
              state
            }
          }
      }
    }
  }
  |> actor.continue()
}

pub fn fetch_profile(uuid: uuid.Uuid) -> Result(profile.Profile, String) {
  let request =
    request.new()
    |> request.set_host(mojang_base_profile_host)
    |> request.set_path(mojang_base_profile_path <> "/" <> uuid.to_string(uuid))
    |> request.set_query([#("unsigned", "false")])
  let response =
    httpc.configure() |> httpc.timeout(5000) |> httpc.dispatch(request)
  case response {
    Ok(response.Response(body:, ..)) -> {
      case json.parse(body, profile.decoder()) {
        Ok(profile) -> Ok(profile)
        Error(error) ->
          Error("Unable to decode JSON response: " <> string.inspect(error))
      }
    }
    Error(error) -> {
      Error("Unable to contact HTTP server: " <> string.inspect(error))
    }
  }
}
