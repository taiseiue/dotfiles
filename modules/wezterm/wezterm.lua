local wezterm = require 'wezterm'

local config = {}

-- Font
config.font = wezterm.font_with_fallback {
  "PlemolJP Console NF",
}
config.font_size = 21

-- Color Scheme
config.color_scheme = "Tango (terminal.sexy)"

-- Transparency and Blur
config.window_background_opacity = 0.6
config.macos_window_background_blur = 20

-- Window Decorations
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_padding = {
  left = 6,
  right = 6,
  top = 30,
  bottom = 6,
}

-- Tab Bar
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- Initial Size
config.initial_cols = 120
config.initial_rows = 34

-- Scrollback
config.scrollback_lines = 10000

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

  -- タブ移動
  { key = 'n', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(1) },
  { key = 'p', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(-1) },
  -- タブ移動(iTerm2)
  { key = 'LeftArrow' , mods = 'LEADER', action = wezterm.action.ActivateTabRelative(-1) },
  { key = 'RightArrow', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(1) },

  -- 単語単位操作
  { key = "LeftArrow",  mods = "ALT", action = wezterm.action.SendKey { key = "b", mods = "META" } },
  { key = "RightArrow", mods = "ALT", action = wezterm.action.SendKey { key = "f", mods = "META" } },
  { key = "Backspace",  mods = "ALT", action = wezterm.action.SendKey { key = "Backspace", mods = "META" } },
}

-- macのOptionキーをAltキーにする
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

return config
