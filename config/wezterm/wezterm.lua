-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.window_padding = {
	left = 10,
	right = 10,
	top = 20,
	bottom = 0,
}
-- JetbrainsMono Nerd Font
-- This is where you actually apply your config choices
-- config.font = wezterm.font 'CaskaydiaCove Nerd Font'
-- config.font = wezterm.font("CaskaydiaCove Nerd Font", { weight = "Regular" })
-- config.font = wezterm.font("ComicCodeLigatures Nerd Font", { weight = 400 })
-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
config.font_size = 14
config.line_height = 0.885
config.window_decorations = "RESIZE"
config.adjust_window_size_when_changing_font_size = false
config.initial_rows = 40
config.initial_cols = 130

config.hide_tab_bar_if_only_one_tab = true
-- config.color_scheme = 'Ayu Mirage'
--
-- config.color_scheme = "Spacedust (Gogh)"
-- config.color_scheme = "tokyonight"
-- config.color_scheme = 'rose-pine'
-- config.color_scheme = 'Cai (Gogh)'
-- config.color_scheme = 'carbonfox'
config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = 'Gotham (Gogh)'
--config.window_background_opacity = 0.8
--
return config
