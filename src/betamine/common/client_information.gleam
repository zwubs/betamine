import betamine/common/chat/chat_mode
import betamine/common/entity/entity_handedness
import betamine/common/entity/player/player_model_customization
import betamine/common/particle_status

pub type ClientInformation {
  ClientInformation(
    locale: String,
    view_distance: Int,
    chat_mode: chat_mode.ChatMode,
    chat_colors: Bool,
    model_customizations: player_model_customization.PlayerModelCustomization,
    main_hand: entity_handedness.EntityHandedness,
    text_filtering_enabled: Bool,
    allows_listing: Bool,
    particle_status: particle_status.ParticleStatus,
  )
}

pub fn default() {
  ClientInformation(
    "en_us",
    2,
    chat_mode.Enabled,
    True,
    player_model_customization.default(),
    entity_handedness.Right,
    False,
    False,
    particle_status.All,
  )
}
