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

local workspace_switcher = wezterm.plugin.require 'https://github.com/MLFlexer/smart_workspace_switcher.wezterm'
workspace_switcher.set_zoxide_path '/opt/homebrew/bin/zoxide'

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
  -- show the pane selection mode, but have it swap the active and selected panes
  {
    mods = 'LEADER',
    key = '0',
    action = wezterm.action.PaneSelect {
      mode = 'SwapWithActive',
    },
  },
  -- smart workspace switcher
  {
    mods = 'LEADER',
    key = 'Space',
    action = workspace_switcher.switch_workspace(),
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

local mux = wezterm.mux

wezterm.on('gui-attached', function()
  for _, window in ipairs(mux.all_windows()) do
    window:gui_window():set_position(77, 127)
    window:gui_window():set_inner_size(2872, 1756)
  end
end)

return config
