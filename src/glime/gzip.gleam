@external(erlang, "zlib", "gzip")
pub fn compress(data: BitArray) -> BitArray

@external(erlang, "zlib", "gunzip")
pub fn decompress(data: BitArray) -> BitArray
