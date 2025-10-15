local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 10.0
config.line_height = 1.2

config.enable_tab_bar = false
config.enable_wayland = true

return config
