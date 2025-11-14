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
  -- show the pane selection mode, but have it swap the active and selected panes
  {
    mods = 'LEADER',
    key = '0',
    action = wezterm.action.PaneSelect {
      mode = 'SwapWithActive',
    },
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

local smart_splits = wezterm.plugin.require 'https://github.com/mrjones2014/smart-splits.nvim'
smart_splits.apply_to_config(config)

local mux = wezterm.mux

wezterm.on('gui-attached', function()
  for _, window in ipairs(mux.all_windows()) do
    window:gui_window():set_position(77, 127)
    window:gui_window():set_inner_size(2872, 1756)
  end
end)

local function base_path_name(str)
  return string.gsub(str, '(.*[/\\])(.*)', '%2')
end

wezterm.on('update-status', function(window)
  local palette = window:effective_config().resolved_palette

  local left_divider = wezterm.format {
    { Background = { Color = palette.ansi[2] } },
    { Foreground = { Color = palette.background } },
    { Text = utf8.char(0xe0bc) .. ' ' },
  }

  local time = wezterm.format {
    { Attribute = { Intensity = 'Bold' } },
    { Foreground = { Color = palette.background } },
    { Background = { Color = palette.ansi[2] } },
    -- and say hello
    { Text = utf8.char(0xf43a) .. wezterm.time.now():format ' %H:%M ' },
  }

  local right_divider = wezterm.format {
    { Background = { Color = palette.ansi[5] } },
    { Foreground = { Color = palette.ansi[2] } },
    { Text = utf8.char(0xe0bc) .. ' ' },
  }

  local workspace_name = wezterm.format {
    { Attribute = { Intensity = 'Bold' } },
    { Foreground = { Color = palette.background } },
    { Background = { Color = palette.ansi[5] } },
    { Text = base_path_name(window:active_workspace()) },
  }

  window:set_right_status(left_divider .. time .. right_divider .. workspace_name)
end)

return config
