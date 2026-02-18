import betamine/common/profile
import betamine/common/uuid
import betamine/constant.{mojang_base_profile_host, mojang_base_profile_path}
import gleam/http/request
import gleam/http/response
import gleam/httpc
import gleam/json
import gleam/result

pub type Error {
  HttpError(httpc.HttpError)
  DecodeError(json.DecodeError)
}

pub fn fetch_profile(uuid: uuid.Uuid) {
  let request =
    request.new()
    |> request.set_host(mojang_base_profile_host)
    |> request.set_path(mojang_base_profile_path <> "/" <> uuid.to_string(uuid))
    |> request.set_query([#("unsigned", "false")])
  let response =
    httpc.configure() |> httpc.timeout(5000) |> httpc.dispatch(request)
  case response {
    Ok(response.Response(body:, ..)) ->
      json.parse(body, profile.decoder()) |> result.map_error(DecodeError)
    // Temporary, should be removed later.
    Error(httpc.ResponseTimeout) -> Ok(profile.Profile(uuid, "", []))
    Error(error) -> Error(HttpError(error))
  }
}
