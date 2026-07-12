-- ~/.config/hypr/keybinds.lua
local mainMod = "ALT"

-- Switch to monocle layout on current workspace
local function set_monocle()
	local ws = hl.get_active_workspace()
	if ws == nil then
		return
	end
	hl.workspace_rule({
		workspace = ws.name,
		layout = "monocle",
		gaps_out = 4,
		gaps_in = 0,
		border_size = 0,
	})
end

-- Switch to master layout on current workspace
local function set_master()
	local ws = hl.get_active_workspace()
	if ws == nil then
		return
	end
	hl.workspace_rule({
		workspace = ws.name,
		layout = "master",
		gaps_out = 9,
		gaps_in = 5,
		border_size = 2,
	})
end

-- Launchers
hl.bind("CTRL + RETURN", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exit())
hl.bind("CTRL + SPACE", hl.dsp.exec_cmd("wofi --show drun"))
hl.bind(mainMod .. " + CTRL + SPACE", hl.dsp.exec_cmd("wofi-emoji"))

-- Layout switches
hl.bind(mainMod .. " + F", set_monocle)
hl.bind(mainMod .. " + T", set_master)

-- Float / utility
hl.bind(mainMod .. " + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + U", hl.dsp.exec_cmd("~/.config/waybar/scripts/toggle_waybar.sh"))

-- App launchers
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("blueman-manager"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("pavucontrol"))

-- Notification history
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("makoctl dismiss"))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("makoctl restore"))

-- Volume keys
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -3%"), { locked = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +3%"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"), { locked = true })

-- Cycle focus
hl.bind(mainMod .. " + n", hl.dsp.layout("cycleprev"))
hl.bind(mainMod .. " + e", hl.dsp.layout("cyclenext"))

-- Move windows
hl.bind(mainMod .. " + i", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + o", hl.dsp.window.move({ direction = "right" }))

-- Switch workspaces
hl.bind(mainMod .. " + l", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + u", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + y", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + semicolon", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + period", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + comma", hl.dsp.focus({ workspace = "-1" }))

-- Move window to workspace
hl.bind(mainMod .. " + CTRL + l", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + CTRL + u", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + CTRL + y", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + CTRL + semicolon", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + CTRL + j", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + CTRL + comma", hl.dsp.window.move({ workspace = "+1" }))

-- Previous workspace
hl.bind(mainMod .. " + slash", hl.dsp.focus({ workspace = "previous" }))

-- Mouse scroll workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move / resize windows with alt + mouse drag
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
