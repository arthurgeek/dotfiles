local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font('FiraCode Nerd Font')
config.font_size = 18.0
config.freetype_load_target = 'HorizontalLcd'

config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.switch_to_last_active_tab_when_closing_tab = true
config.tab_bar_at_bottom = true

config.window_padding = {
  left = '0cell',
  right = '0cell',
  top = '1.5cell',
  bottom = '0cell'
}

local act = wezterm.action

config.keys = {
  {
    key = 'k',
    mods = 'CMD',
    action = act.ClearScrollback 'ScrollbackAndViewport',
  },
  {
    key = '/',
    mods = 'ALT|CTRL',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' },
  },
}

config.unix_domains = {
  {
    name = 'unix',
  },
}

config.default_gui_startup_args = { 'connect', 'unix' }

return config
