-- Generated from theme/signal-noir.json.
local color = {
  canvas = "#121019",
  panel = "#0f0f1a",
  raised = "#121124",
  deep = "#221727",
  surface = "#201a2f",
  edge = "#2a1d31",
  text = "#eee9ff",
  soft = "#ffeef2",
  cool = "#dffff8",
  pink = "#ff91c3",
  signal = "#ff338f",
  violet = "#c79eff",
  mint = "#98e4a7",
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
    info = color.cool,
    accent = color.pink,
    danger = color.signal,
    focus = color.violet,
    success = color.mint,
    on_accent = color.deep,
  },
}

for name, value in pairs(color) do
  theme[name] = value
end

return theme
