-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- add your font here
config.font = wezterm.font 'OpenDyslexicM Nerd Font Mono'
config.font_size = 20

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.window_background_opacity = 0.6
config.window_background_blur = 10

-- and finally, return the configuration to wezterm
return config
