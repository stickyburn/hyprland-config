local p = require("config.palette")

local current = "dark"

local terminal = {
  dark = {
    p.canvas, p.signal, p.mint, p.pink,
    p.violet, p.pink, p.mint, p.text,
    p.edge, p.signal, p.mint, p.soft,
    p.violet, p.pink, p.mint, p.soft,
  },
  light = {
    p.canvas, p.signal_light_mode, p.mint_light_mode, p.pink,
    p.violet_light_mode, p.pink, p.mint_light_mode, p.edge,
    p.edge, p.signal_light_mode, p.mint_light_mode, p.pink,
    p.violet_light_mode, p.pink, p.mint_light_mode, p.canvas,
  },
}

local function hi(group, spec)
  vim.api.nvim_set_hl(0, group, spec)
end

local function apply()
  vim.o.background = current
  vim.cmd("highlight clear")
  vim.g.colors_name = "neonway"

  local r = current == "light" and p.light_role or p.role
  local diffAddFg = current == "light" and p.mint_light_mode or p.mint

  hi("Normal", { fg = r.foreground, bg = r.background })
  hi("NormalNC", { fg = r.foreground_muted, bg = r.background })
  hi("NormalFloat", { fg = r.foreground, bg = r.elevated_bg })
  hi("FloatBorder", { fg = r.focus, bg = r.elevated_bg })
  hi("FloatTitle", { fg = r.foreground, bg = r.elevated_bg, bold = true })
  hi("ColorColumn", { bg = r.panel_bg })
  hi("Cursor", { fg = r.background, bg = r.foreground })
  hi("CursorLine", { bg = r.panel_bg })
  hi("CursorLineNr", { fg = r.accent, bg = r.panel_bg, bold = true })
  hi("LineNr", { fg = r.border })
  hi("SignColumn", { bg = r.background })
  hi("EndOfBuffer", { fg = r.background, bg = r.background })
  hi("Visual", { bg = r.selection_bg })
  hi("Search", { fg = r.on_accent, bg = r.accent, bold = true })
  hi("IncSearch", { fg = r.on_accent, bg = r.danger, bold = true })
  hi("MatchParen", { fg = r.info, bg = r.selection_bg, bold = true })
  hi("Pmenu", { fg = r.foreground_muted, bg = r.elevated_bg })
  hi("PmenuSel", { fg = r.on_accent, bg = r.focus, bold = true })
  hi("PmenuSbar", { bg = r.panel_bg })
  hi("PmenuThumb", { bg = r.focus })
  hi("WhichKeyNormal", { fg = r.foreground, bg = r.background })
  hi("SnacksPickerSelected", { fg = r.on_accent, bg = r.focus, bold = true })
  hi("SnacksPickerListCursorLine", { fg = r.on_accent, bg = r.focus })
  hi("SnacksPickerBorder", { fg = r.focus, bg = r.elevated_bg })
  hi("SnacksInputBorder", { fg = r.focus, bg = r.elevated_bg })
  hi("StatusLine", { fg = r.foreground, bg = r.background })
  hi("StatusLineNC", { fg = r.border, bg = r.background })
  hi("TabLine", { fg = r.accent, bg = r.panel_bg })
  hi("TabLineSel", { fg = r.background, bg = r.focus, bold = true })
  hi("TabLineFill", { bg = r.background })
  hi("WinSeparator", { fg = r.border, bg = r.background })
  hi("Directory", { fg = r.focus })
  hi("Title", { fg = r.accent, bold = true })
  hi("Comment", { fg = r.focus, italic = true })
  hi("Constant", { fg = r.accent })
  hi("String", { fg = r.success })
  hi("Character", { fg = r.success })
  hi("Number", { fg = r.danger })
  hi("Boolean", { fg = r.danger, bold = true })
  hi("Identifier", { fg = r.foreground })
  hi("Function", { fg = r.info })
  hi("Statement", { fg = r.accent })
  hi("Keyword", { fg = r.accent, italic = true })
  hi("Operator", { fg = r.focus })
  hi("PreProc", { fg = r.focus })
  hi("Type", { fg = r.info })
  hi("Special", { fg = r.focus })
  hi("Delimiter", { fg = r.foreground_muted })
  hi("Underlined", { fg = r.info, underline = true })
  hi("Todo", { fg = r.background, bg = r.accent, bold = true })
  hi("Error", { fg = r.danger, bold = true })
  hi("DiagnosticError", { fg = r.danger })
  hi("DiagnosticWarn", { fg = r.accent })
  hi("DiagnosticInfo", { fg = r.info })
  hi("DiagnosticHint", { fg = r.focus })
  hi("DiffAdd", { fg = diffAddFg, bg = r.elevated_bg })
  hi("DiffChange", { fg = r.accent, bg = r.elevated_bg })
  hi("DiffDelete", { fg = r.danger, bg = r.elevated_bg })
  hi("DiffText", { fg = r.background, bg = r.focus, bold = true })

  for group, target in pairs({
    ["@comment"] = "Comment",
    ["@constant"] = "Constant",
    ["@string"] = "String",
    ["@number"] = "Number",
    ["@boolean"] = "Boolean",
    ["@variable"] = "Identifier",
    ["@variable.builtin"] = "Special",
    ["@function"] = "Function",
    ["@function.builtin"] = "Function",
    ["@keyword"] = "Keyword",
    ["@operator"] = "Operator",
    ["@type"] = "Type",
    ["@type.builtin"] = "Type",
    ["@punctuation"] = "Delimiter",
    ["@tag"] = "Keyword",
    ["@tag.attribute"] = "Identifier",
  }) do
    hi(group, { link = target })
  end

  for i, c in ipairs(terminal[current]) do
    vim.g["terminal_color_" .. (i - 1)] = c
  end
end

local function set(scheme)
  current = scheme
  apply()
end

apply()

vim.api.nvim_create_user_command("NeonwayToggle", function()
  set(current == "dark" and "light" or "dark")
end, {})
vim.api.nvim_create_user_command("NeonwayLight", function()
  set("light")
end, {})
vim.api.nvim_create_user_command("NeonwayDark", function()
  set("dark")
end, {})
