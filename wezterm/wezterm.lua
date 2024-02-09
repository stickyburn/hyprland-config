local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font_with_fallback({
	"Liga Comic Shanns",
	"Symbols Nerd Font Mono",
})
config.font_size = 10.0
config.colors = {
	background = "#362E45",
	foreground = "#FFCCDD",
}
-- config.enable_tab_bar = false
config.default_cursor_style = "SteadyUnderline"
config.hide_tab_bar_if_only_one_tab = true

return config
