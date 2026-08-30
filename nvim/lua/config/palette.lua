-- Generated from neonway.
local color = {
  canvas = "#14111B",
  panel = "#0f0f1a",
  raised = "#121124",
  deep = "#221727",
  surface = "#201a2f",
  edge = "#2a1d31",
  text = "#eee9ff",
  soft = "#ffeef2",
  pink = "#ff91c3",
  signal = "#ff338f",
  violet = "#c79eff",
  mint = "#98e4a7",
  mint_tint = "#dffff8",
  violet_light_mode = "#7740aa",
  mint_light_mode = "#197344",
  signal_light_mode = "#c51f6c",
  lavender_light_mode = "#d9cff8",
}

local theme = {
  color = color,
  role = {
    background = color.canvas,
    panel_bg = color.panel,
    elevated_bg = color.raised,
    selection_bg = color.surface,
    border = color.edge,
    foreground = color.text,
    foreground_muted = color.soft,
    info = color.mint,
    accent = color.pink,
    danger = color.signal,
    focus = color.violet,
    success = color.mint,
    on_accent = color.deep,
  },
  light_role = {
    background = color.text,
    panel_bg = color.lavender_light_mode,
    elevated_bg = color.lavender_light_mode,
    selection_bg = color.mint_light_mode,
    border = color.violet_light_mode,
    foreground = color.canvas,
    foreground_muted = color.edge,
    info = color.mint_light_mode,
    accent = color.pink,
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
