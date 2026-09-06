-- Generated from hyprway.
local color = {
  canvas = "#14111B",
  panel = "#181420",
  surface = "#22112A",
  edge = "#2a1d31",
  text = "#eee9ff",
  soft = "#ffeef2",
  pink = "#ff91c3",
  signal = "#ff338f",
  violet = "#c79eff",
  mint = "#98e4a7",
  mint_tint = "#dffff8",
  pink_light_mode = "#a62d68",
  violet_light_mode = "#7740aa",
  mint_light_mode = "#197344",
  signal_light_mode = "#bf1d68",
  lavender_light_mode = "#e9defd",
}

local theme = {
  color = color,
  role = {
    background = color.canvas,
    panel_bg = color.panel,
    elevated_bg = color.panel,
    selection_bg = color.surface,
    border = color.edge,
    foreground = color.text,
    foreground_muted = color.soft,
    accent = color.pink,
    danger = color.signal,
    focus = color.violet,
    success = color.mint,
    on_accent = color.edge,
  },
  light_role = {
    background = color.text,
    panel_bg = color.lavender_light_mode,
    elevated_bg = color.lavender_light_mode,
    selection_bg = color.lavender_light_mode,
    border = color.violet_light_mode,
    foreground = color.canvas,
    foreground_muted = color.edge,
    accent = color.pink_light_mode,
    danger = color.signal_light_mode,
    focus = color.violet_light_mode,
    success = color.mint_light_mode,
    on_accent = color.text,
  },
}

for name, value in pairs(color) do
  theme[name] = value
end

return theme
