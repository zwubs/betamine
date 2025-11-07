import gleam/float
import gleam/int
import gleam/list
import iv

const permutation_table = [
  151, 160, 137, 091, 090, 015, 131, 013, 201, 095, 096, 053, 194, 233, 007, 225,
  140, 036, 103, 030, 069, 142, 008, 099, 037, 240, 021, 010, 023, 190, 006, 148,
  247, 120, 234, 075, 000, 026, 197, 062, 094, 252, 219, 203, 117, 035, 011, 032,
  057, 177, 033, 088, 237, 149, 056, 087, 174, 020, 125, 136, 171, 168, 068, 175,
  074, 165, 071, 134, 139, 048, 027, 166, 077, 146, 158, 231, 083, 111, 229, 122,
  060, 211, 133, 230, 220, 105, 092, 041, 055, 046, 245, 040, 244, 102, 143, 054,
  065, 025, 063, 161, 001, 216, 080, 073, 209, 076, 132, 187, 208, 089, 018, 169,
  200, 196, 135, 130, 116, 188, 159, 086, 164, 100, 109, 198, 173, 186, 003, 064,
  052, 217, 226, 250, 124, 123, 005, 202, 038, 147, 118, 126, 255, 082, 085, 212,
  207, 206, 059, 227, 047, 016, 058, 017, 182, 189, 028, 042, 223, 183, 170, 213,
  119, 248, 152, 002, 044, 154, 163, 070, 221, 153, 101, 155, 167, 043, 172, 009,
  129, 022, 039, 253, 019, 098, 108, 110, 079, 113, 224, 232, 178, 185, 112, 104,
  218, 246, 097, 228, 251, 034, 242, 193, 238, 210, 144, 012, 191, 179, 162, 241,
  081, 051, 145, 235, 249, 014, 239, 107, 049, 192, 214, 031, 181, 199, 106, 157,
  184, 084, 204, 176, 115, 121, 050, 045, 127, 004, 150, 254, 138, 236, 205, 093,
  222, 114, 067, 029, 024, 072, 243, 141, 128, 195, 078, 066, 215, 061, 156, 180,
]

fn permutation_array() {
  iv.from_list(list.append(permutation_table, permutation_table))
}

fn fade(t: Float) {
  t *. t *. t *. { t *. { t *. 6.0 -. 15.0 } +. 10.0 }
}

fn lerp(t: Float, a: Float, b: Float) {
  a +. t *. { b -. a }
}

fn grad(hash: Int, x: Float, y: Float, z: Float) {
  case int.bitwise_and(hash, 0xF) {
    0x0 -> x +. y
    0x1 -> -1.0 *. x +. y
    0x2 -> x -. y
    0x3 -> -1.0 *. x -. y
    0x4 -> x +. z
    0x5 -> -1.0 *. x +. z
    0x6 -> x -. z
    0x7 -> -1.0 *. x -. z
    0x8 -> y +. z
    0x9 -> -1.0 *. y +. z
    0xA -> y -. z
    0xB -> -1.0 *. y -. z
    0xC -> y +. x
    0xD -> -1.0 *. y +. z
    0xE -> y -. x
    0xF -> -1.0 *. y -. z
    _ -> 0.0
  }
}

pub fn noise(x: Float, y: Float, z: Float) {
  let permutation = permutation_array()

  let xi = float.truncate(x) |> int.clamp(0, 255)
  let yi = float.truncate(y) |> int.clamp(0, 255)
  let zi = float.truncate(z) |> int.clamp(0, 255)

  let xf = x -. float.floor(x)
  let yf = y -. float.floor(y)
  let zf = z -. float.floor(z)

  let u = fade(xf)
  let v = fade(yf)
  let w = fade(zf)

  let a = iv.get_or_default(permutation, xi, 0) + yi
  let aa = iv.get_or_default(permutation, a, 0) + zi
  let ab = iv.get_or_default(permutation, a + 1, 0) + zi
  let b = iv.get_or_default(permutation, xi + 1, 0) + yi
  let ba = iv.get_or_default(permutation, b, 0) + zi
  let bb = iv.get_or_default(permutation, b + 1, 0) + zi

  lerp(
    w,
    lerp(
      v,
      lerp(
        u,
        grad(iv.get_or_default(permutation, aa, 0), xf, yf, zf),
        grad(iv.get_or_default(permutation, ba, 0), xf -. 1.0, yf, zf),
      ),
      lerp(
        u,
        grad(iv.get_or_default(permutation, ab, 0), xf, yf -. 1.0, zf),
        grad(iv.get_or_default(permutation, bb, 0), xf -. 1.0, yf -. 1.0, zf),
      ),
    ),
    lerp(
      v,
      lerp(
        u,
        grad(iv.get_or_default(permutation, aa + 1, 0), xf, yf, zf -. 1.0),
        grad(
          iv.get_or_default(permutation, ba + 1, 0),
          xf -. 1.0,
          yf,
          zf -. 1.0,
        ),
      ),
      lerp(
        u,
        grad(
          iv.get_or_default(permutation, ab + 1, 0),
          xf,
          yf -. 1.0,
          zf -. 1.0,
        ),
        grad(
          iv.get_or_default(permutation, bb + 1, 0),
          xf -. 1.0,
          yf -. 1.0,
          zf -. 1.0,
        ),
      ),
    ),
  )
}
