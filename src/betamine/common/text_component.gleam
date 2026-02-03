import gleam/json
import nbeet

pub type TextComponent {
  TextComponent(text: String)
}

pub fn to_nbt(text_component: TextComponent) {
  nbeet.root([#("text", nbeet.string(text_component.text))])
}

pub fn to_json(text_component: TextComponent) {
  json.object([#("text", json.string(text_component.text))])
}
