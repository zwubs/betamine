import gleam/list
import gleam/string

pub type Vector3(a) {
  Vector3(x: a, y: a, z: a)
}

pub fn equal(first: Vector3(a), second: Vector3(a)) {
  first.x == second.x && first.y == second.y && first.z == second.z
}

pub fn map(vector: Vector3(a), fun: fn(a) -> b) {
  Vector3(fun(vector.x), fun(vector.y), fun(vector.z))
}

pub fn map2(vector1: Vector3(a), vector2: Vector3(b), fun: fn(a, b) -> c) {
  Vector3(
    fun(vector1.x, vector2.x),
    fun(vector1.y, vector2.y),
    fun(vector1.z, vector2.z),
  )
}

pub fn to_list(vector: Vector3(a)) {
  [vector.x, vector.y, vector.z]
}

pub fn fold(
  over vector: Vector3(a),
  from initial: b,
  with fun: fn(b, a) -> b,
) -> b {
  to_list(vector)
  |> list.fold(initial, fun)
}

pub fn to_string(vector: Vector3(a)) {
  let values = to_list(vector) |> list.map(string.inspect) |> string.join(", ")
  "Vector3(" <> values <> ")"
}
