local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Dracula (Official)'
config.font = wezterm.font('FiraCode Nerd Font Mono')
config.font_size = 16.0
config.freetype_load_target = 'HorizontalLcd'

config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

config.window_padding = {
  left = '0.5cell',
  right = '0.5cell',
  top = '1.5cell',
  bottom = '0'
}

local act = wezterm.action

config.keys = {
  {
    key = 'k',
    mods = 'CMD',
    action = act.Multiple {
      act.ClearScrollback 'ScrollbackAndViewport',
    },
  },
}

return config
