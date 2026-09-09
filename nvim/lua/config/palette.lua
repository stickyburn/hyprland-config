-- Generated from hyprway.
local color = {
  background = "#221727",
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
  background_light = "#eee9ff",
  text_light = "#1F1221",
  pink_light = "#a62d68",
  violet_light = "#7740aa",
  mint_light = "#197344",
  signal_light = "#bf1d68",
  lavender_light = "#e9defd",
}

local theme = {
  color = color,
  role = {
    background = color.background,
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
    background = color.background_light,
    panel_bg = color.lavender_light,
    elevated_bg = color.lavender_light,
    selection_bg = color.lavender_light,
    border = color.violet_light,
    foreground = color.text_light,
    foreground_muted = color.edge,
    accent = color.pink_light,
    danger = color.signal_light,
    focus = color.violet_light,
    success = color.mint_light,
    on_accent = color.text,
  },
}

for name, value in pairs(color) do
  theme[name] = value
end

return theme
