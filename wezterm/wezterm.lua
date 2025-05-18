local wezterm = require 'wezterm'
local config = {}

-- appearance
config.font = wezterm.font_with_fallback({
  "JetBrains Mono",
  "Hiragino Sans",
})

config.font_size = 10
config.color_scheme = 'Monokai Remastered'
config.window_background_opacity = 0.9
config.use_fancy_tab_bar = false
config.colors = {
  tab_bar = {
    active_tab = {
      fg_color = "#202020",
      bg_color = "#bf65e8"
    }
  },
  cursor_bg = "#bf65e8",
  cursor_fg = "#202020"
}

-- keyboard
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false
config.keys = {
  {
    key = ',',
    mods = 'CTRL',
    action = wezterm.action.SplitHorizontal,
  },
  {
    key = '.',
    mods = 'CTRL',
    action = wezterm.action.SplitVertical,
  },
  {
    key = 'j',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Next',
  },
  {
    key = 'F13',
    action = wezterm.action.QuickSelectArgs { patterns = { '\\S+' } },
  },
  {
    key = 'F18',
    action = wezterm.action.ActivateCopyMode,
  },
  {
    key = 'F16',
    action = wezterm.action {
      ActivateTabRelative = -1,
    },
  },
  {
    key = 'F19',
    action = wezterm.action {
      ActivateTabRelative = 1,
    },
  },
}

-- misc
config.default_prog = { '/opt/homebrew/bin/fish' }

return config
