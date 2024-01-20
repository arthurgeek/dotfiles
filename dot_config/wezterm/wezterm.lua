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
config.adjust_window_size_when_changing_font_size = false

config.switch_to_last_active_tab_when_closing_tab = true

wezterm.plugin.require('https://github.com/nekowinston/wezterm-bar').apply_to_config(config, {
  max_width = 48,
  clock = {
    enabled = false,
  },
})

config.window_padding = {
  top = '0.5cell',
  left = '0.75cell',
  right = '0cell',
}

local act = wezterm.action

config.leader = {
  mods = 'CTRL',
  key = 'Space',
  timeout_milliseconds = 1000,
}

config.keys = {
  {
    mods = 'CMD',
    key = 'k',
    action = act.ClearScrollback 'ScrollbackAndViewport',
  },
  -- splitting
  {
    mods = 'LEADER',
    key = '-',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    mods = 'LEADER',
    key = '=',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- pane zoom
  {
    mods = 'LEADER',
    key = 'z',
    action = wezterm.action.TogglePaneZoomState,
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
