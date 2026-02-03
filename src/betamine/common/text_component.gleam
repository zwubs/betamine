import gleam/json
import nbeet/nbt

pub type TextComponent {
  TextComponent(text: String)
}

pub fn to_nbt(text_component: TextComponent) {
  nbt.root([#("text", nbt.string(text_component.text))])
}

pub fn to_json(text_component: TextComponent) {
  json.object([#("text", json.string(text_component.text))])
}
