local wezterm = require 'wezterm'

local config = {}

-- Font
config.font = wezterm.font_with_fallback {
  "PlemolJP Console NF",
}
config.font_size = 21

-- Color Scheme
config.color_scheme = "Tokyo Night"

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

-- Tmux bindings
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
  -- ペイン分割
  { key = '"', mods = 'LEADER|SHIFT', action = wezterm.action.SplitVertical },
  { key = '%', mods = 'LEADER|SHIFT', action = wezterm.action.SplitHorizontal },

  -- ペイン移動
  { key = 'h', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'j', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Down' },
  { key = 'k', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = 'l', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Right' },

  -- ペイン閉じる
  { key = 'x', mods = 'LEADER', action = wezterm.action.CloseCurrentPane { confirm = true } },
}

-- macのOptionキーをAltキーにする
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

return config
