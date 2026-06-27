-- ~/.config/hypr/hyprland.lua
-- Hyprland Lua configuration (0.55+)
-- https://wiki.hyprland.org/Configuring/Start/

---- MONITORS ----
hl.monitor({
	output = "DP-1",
	mode = "3840x2160@165",
	position = "0x0",
	scale = 1.5,
})

---- ENVIRONMENT VARIABLES ----
hl.env("GDK_BACKEND", "wayland")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Cursor
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Amber")
hl.env("XCURSOR_THEME", "Bibata-Modern-Amber")
hl.env("XCURSOR_SIZE", "32")
hl.env("HYPRCURSOR_SIZE", "32")

---- AUTOSTART ----
hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("mako")
	hl.exec_cmd("waybar")
	hl.exec_cmd("pipewire")
	hl.exec_cmd("pipewire-pulse")
	hl.exec_cmd("wireplumber")
end)

---- XWAYLAND ----
hl.config({
	xwayland = { enabled = false },
})

---- GENERAL ----
hl.config({
	general = {
		layout = "master",
		gaps_in = 4,
		gaps_out = { top = 6, right = 8, bottom = 8, left = 8 },
		border_size = 2,
		col = {
			active_border = { colors = { "rgb(FFCCDD)", "rgb(FF338F)" }, angle = 45 },
			inactive_border = "rgb(362e45)",
		},
		allow_tearing = false,
	},
})

---- INPUT ----
hl.config({
	input = {
		kb_layout = "us",
		follow_mouse = 1,
		float_switch_override_focus = 2,
		sensitivity = 0.6,
		repeat_rate = 28,
		repeat_delay = 500,
	},
})

---- CURSOR ----
hl.config({
	cursor = {
		inactive_timeout = 5,
		persistent_warps = true,
	},
})

---- DWINDLE ----
hl.config({
	dwindle = {
		force_split = 0,
		use_active_for_splits = true,
		preserve_split = true,
	},
})

---- MASTER ----
hl.config({
	master = {
		mfact = 0.50,
		special_scale_factor = 1.0,
	},
})

---- MISC ----
hl.config({
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		enable_swallow = true,
	},
})

---- DEBUG ----
hl.config({
	debug = { vfr = 1 },
})

---- DECORATION ----
hl.config({
	decoration = {
		rounding = 10,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		fullscreen_opacity = 1.0,
		blur = {
			enabled = true,
			size = 2,
			passes = 2,
			ignore_opacity = true,
			xray = true,
			popups = true,
		},
		shadow = {
			enabled = true,
			range = 20,
			render_power = 3,
			color = 0x66000000,
		},
	},
})

---- BINDS CONFIG ----
hl.config({
	binds = {
		workspace_back_and_forth = 0,
		allow_workspace_cycles = 0,
	},
})

---- BEZIER CURVES ----
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("md3_standard", { type = "bezier", points = { { 0.2, 0 }, { 0, 1 } } })
hl.curve("md3_decel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
hl.curve("md3_accel", { type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } })
hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.1 } } })
hl.curve("crazyshot", { type = "bezier", points = { { 0.1, 1.5 }, { 0.76, 0.92 } } })
hl.curve("hyprnostretch", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.0 } } })
hl.curve("fluent_decel", { type = "bezier", points = { { 0.1, 1 }, { 0, 1 } } })
hl.curve("easeInOutCirc", { type = "bezier", points = { { 0.85, 0 }, { 0.15, 1 } } })
hl.curve("easeOutCirc", { type = "bezier", points = { { 0, 0.55 }, { 0.45, 1 } } })
hl.curve("easeOutExpo", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })

---- ANIMATIONS ----
hl.config({ animations = { enabled = true } })
hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "md3_decel", style = "popin 60%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 2.5, bezier = "md3_decel" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3.5, bezier = "easeOutExpo", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, bezier = "md3_decel", style = "slidevert" })

---- WINDOW RULES ----
hl.window_rule({
	name = "suppress-maximize",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "float-blueman",
	match = { class = "^(blueman-manager)$" },
	float = true,
})

hl.window_rule({
	name = "float-pavucontrol",
	match = { class = "^(org.pulseaudio.pavucontrol)$" },
	float = true,
})

hl.window_rule({
	name = "float-pip",
	match = { title = "^(Picture in picture)$" },
	float = true,
})

hl.window_rule({
	name = "float-file-dialogs",
	match = { title = "^(Open Files|Open File|Save File)$" },
	float = true,
	center = true,
})

hl.window_rule({
	name = "no-blur-video-apps",
	match = { class = "^(raffi|com\\.stremio\\.stremio)$" },
	opaque = true,
})

---- LAYER RULES ----
hl.layer_rule({
	name = "no-anim-selection",
	match = { namespace = "selection" },
	no_anim = true,
})

---- KEYBINDINGS ----
local script_dir = debug.getinfo(1, "S").source:sub(2):match("(.*/)") or "./"
dofile(script_dir .. "keybinds.lua")
