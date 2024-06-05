-- Pull in the wezterm API
local wezterm = require("wezterm")

local platform = require("./platform")()

local options = {
	default_prog = {},
	launch_menu = {},
}
-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.color_scheme = "Catppuccin Macchiato"

-- config.font = wezterm.font("Cascadia Code")
-- config.font = wezterm.font("CaskaydiaCove Nerd Font")

config.font = wezterm.font_with_fallback({
	{ family = "CaskaydiaCove Nerd Font" },
	{ family = "MesloLGS NF" },
	{ family = "Symbols Nerd Font", scale = 0.75 },
})

if platform.is_win then
	config.default_prog = { "C:/Program Files/PowerShell/7/pwsh.exe" }
	config.launch_menu = {
		{ label = "PowerShell Core", args = { "pwsh" } },
		{ label = "PowerShell Desktop", args = { "powershell" } },
		{ label = "Command Prompt", args = { "cmd" } },
	}
end

config.enable_tab_bar = true
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

config.default_cursor_style = "BlinkingBar"
config.cursor_blink_ease_in = "Linear"
config.cursor_blink_ease_out = "Linear"
config.cursor_blink_rate = 600

config.warn_about_missing_glyphs = false

config.audible_bell = "Disabled"

config.hide_tab_bar_if_only_one_tab = true

-- and finally, return the configuration to wezterm
return config
