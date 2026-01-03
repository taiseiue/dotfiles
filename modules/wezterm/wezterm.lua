local wezterm = require 'wezterm'

local config = {}

-- Font
config.font = wezterm.font_with_fallback {
  "PlemolJP Console NF",
}
config.font_size = 13.0

-- Color Scheme
config.color_scheme = "Catppuccin Mocha"

-- Transparency and Blur
config.window_background_opacity = 0.92
config.macos_window_background_blur = 20

-- Tab Bar
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- Initial Size
config.initial_cols = 120
config.initial_rows = 34

-- Scrollback
config.scrollback_lines = 10000

-- Ctrl+Backspace deletes a word
config.keys = {
  {
    key = 'Backspace',
    mods = 'CTRL',
    action = wezterm.action.SendKey {
      key = 'w',
      mods = 'CTRL',
    },
  },
}

return config
