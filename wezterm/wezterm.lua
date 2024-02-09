local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

-- "#362E45",
config.font = wezterm.font_with_fallback({
	"Liga Comic Shanns",
	"JoyPixels",
})
config.font_size = 10.0
config.colors = {
	background = "#30293d",
	foreground = "#FFCCDD",
}
config.default_cursor_style = "SteadyUnderline"
config.hide_tab_bar_if_only_one_tab = true

config.keys = {
	{ key = "PageUp", action = act.ScrollByLine(-1) },
	{ key = "PageDown", action = act.ScrollByLine(1) },
}

return config
