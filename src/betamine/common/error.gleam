pub type Error {
  InvalidEnumValue(name: String, min: Int, max: Int, value: Int)
}
