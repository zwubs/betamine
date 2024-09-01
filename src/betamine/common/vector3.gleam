import gleam/float
import gleam/list

pub type Vector3(a) {
  Vector3(x: a, y: a, z: a)
}

pub fn equal(first: Vector3(a), second: Vector3(a)) {
  first.x == second.x && first.y == second.y && first.z == second.z
}

pub fn subtract(first: Vector3(Float), second: Vector3(Float)) {
  Vector3(first.x -. second.x, first.y -. second.y, first.z -. second.z)
}

pub fn multiply_by_scalar(vector3: Vector3(Float), scalar: Float) {
  map(vector3, fn(vector3) { vector3 *. scalar })
}

pub fn map(vector: Vector3(a), fun: fn(a) -> b) {
  Vector3(fun(vector.x), fun(vector.y), fun(vector.z))
}

pub fn truncate(vector3: Vector3(Float)) {
  map(vector3, float.truncate)
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
