local wezterm = require 'wezterm'

local config = wezterm.config_builder()

local custom = wezterm.color.get_builtin_schemes()['Catppuccin Mocha']
custom.tab_bar.background = custom.background

config.color_schemes = {
  ['Catppuccin Custom'] = custom,
}
config.color_scheme = 'Catppuccin Custom'

config.font = wezterm.font 'FiraCode Nerd Font'
config.font_size = 18.0
config.freetype_load_target = 'HorizontalLcd'

config.window_decorations = 'RESIZE'

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.switch_to_last_active_tab_when_closing_tab = true
config.tab_bar_at_bottom = true

config.window_padding = {
  top = '0.5cell',
  left = '0.75cell',
  right = '0cell',
}

local act = wezterm.action

config.keys = {
  {
    key = 'k',
    mods = 'CMD',
    action = act.ClearScrollback 'ScrollbackAndViewport',
  },
  {
    key = '?',
    mods = 'CTRL|SHIFT',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' },
  },
}

config.unix_domains = {
  {
    name = 'unix',
  },
}

config.default_gui_startup_args = { 'connect', 'unix' }

local zen = require 'zen'

zen.apply()

return config
