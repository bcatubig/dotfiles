local wezterm = require('wezterm')
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = 'nordfox'
config.window_background_opacity = 0.95
config.font = wezterm.font('JetBrainsMono Nerd Font')

config.keys = {
	{
		key = '%',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
	},
	{
		key = '"',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.SplitVertical({ domain = 'CurrentPaneDomain' }),
	},
}
return config
