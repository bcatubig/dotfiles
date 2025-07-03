-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

local is_linux = function()
	return wezterm.target_triple:find("linux") ~= nil
end

local is_darwin = function()
	return wezterm.target_triple:find("darwin") ~= nil
end

config.color_scheme = "onedarkpro_onedark"
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium" })
config.font_size = is_darwin() and 16 or 13
config.scrollback_lines = 20000
config.use_fancy_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.98
config.mouse_wheel_scrolls_tabs = false
config.enable_scroll_bar = false
config.send_composed_key_when_left_alt_is_pressed = false
-- config.default_domain = "unix"

config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

config.keys = {
	{ key = "LeftArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bb" }) },
	-- Make Option-Right equivalent to Alt-f; forward-word
	{ key = "RightArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bf" }) },
	{
		key = "t",
		mods = "CMD|SHIFT",
		action = act.ShowTabNavigator,
	},
	{
		key = '"',
		mods = "CMD|SHIFT",
		action = act.SplitVertical,
	},
	{
		key = "-",
		mods = "CMD|SHIFT",
		action = act.SplitHorizontal,
	},
	{
		key = "UpArrow",
		mods = "SUPER",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "SUPER",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "LeftArrow",
		mods = "SUPER",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "SUPER",
		action = act.ActivatePaneDirection("Right"),
	},
}

return config
