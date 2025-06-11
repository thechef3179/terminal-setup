-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- setting window padding
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

-- setting color scheme for wezterm
config.color_scheme = "ayu"
-- config.color_scheme = "GruvboxDarkHard"

config.font = wezterm.font 'Monofur Nerd Font'
config.font_size = 24
config.font = wezterm.font 'OpenDyslexicM Nerd Font Mono'
config.font_size = 18
-- config.font = wezterm.font 'SauceCodePro Nerd Font Mono'

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

-- config.window_background_opacity = 0.6
-- config.macos_window_background_blur = 10

-- and finally, return the configuration to wezterm
return config
