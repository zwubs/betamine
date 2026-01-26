import betamine/common/profile
import betamine/common/uuid
import betamine/constant.{mojang_base_profile_host, mojang_base_profile_path}
import gleam/http/request
import gleam/httpc
import gleam/json
import gleam/result

pub fn fetch_profile(uuid: uuid.Uuid) {
  let request =
    request.new()
    |> request.set_host(mojang_base_profile_host)
    |> request.set_path(mojang_base_profile_path <> "/" <> uuid.to_string(uuid))
    |> request.set_query([#("unsigned", "false")])
  let response = httpc.send(request)
  use resp <- result.try(response)
  let assert Ok(profile) = json.parse(resp.body, profile.decoder())
  Ok(profile)
}
