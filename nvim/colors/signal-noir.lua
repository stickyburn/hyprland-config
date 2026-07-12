local p = require("config.palette")

vim.cmd("highlight clear")
vim.g.colors_name = "signal-noir"
vim.o.background = "dark"

local function hi(group, spec)
  vim.api.nvim_set_hl(0, group, spec)
end

hi("Normal", { fg = p.text, bg = p.canvas })
hi("NormalNC", { fg = p.soft, bg = p.canvas })
hi("NormalFloat", { fg = p.text, bg = p.raised })
hi("FloatBorder", { fg = p.violet, bg = p.raised })
hi("FloatTitle", { fg = p.text, bg = p.raised, bold = true })
hi("ColorColumn", { bg = p.panel })
hi("Cursor", { fg = p.canvas, bg = p.text })
hi("CursorLine", { bg = p.panel })
hi("CursorLineNr", { fg = p.pink, bg = p.panel, bold = true })
hi("LineNr", { fg = p.edge })
hi("SignColumn", { bg = p.canvas })
hi("EndOfBuffer", { fg = p.canvas, bg = p.canvas })
hi("Visual", { bg = p.edge })
hi("Search", { fg = p.deep, bg = p.pink, bold = true })
hi("IncSearch", { fg = p.canvas, bg = p.signal, bold = true })
hi("MatchParen", { fg = p.cool, bg = p.surface, bold = true })
hi("Pmenu", { fg = p.soft, bg = p.raised })
hi("PmenuSel", { fg = p.deep, bg = p.violet, bold = true })
hi("PmenuSbar", { bg = p.panel })
hi("PmenuThumb", { bg = p.violet })
hi("StatusLine", { fg = p.text, bg = p.panel })
hi("StatusLineNC", { fg = p.edge, bg = p.canvas })
hi("TabLine", { fg = p.pink, bg = p.panel })
hi("TabLineSel", { fg = p.canvas, bg = p.violet, bold = true })
hi("TabLineFill", { bg = p.canvas })
hi("WinSeparator", { fg = p.edge, bg = p.canvas })
hi("Directory", { fg = p.violet })
hi("Title", { fg = p.pink, bold = true })
hi("Comment", { fg = p.violet, italic = true })
hi("Constant", { fg = p.pink })
hi("String", { fg = p.mint })
hi("Character", { fg = p.mint })
hi("Number", { fg = p.signal })
hi("Boolean", { fg = p.signal, bold = true })
hi("Identifier", { fg = p.text })
hi("Function", { fg = p.cool })
hi("Statement", { fg = p.pink })
hi("Keyword", { fg = p.pink, italic = true })
hi("Operator", { fg = p.violet })
hi("PreProc", { fg = p.violet })
hi("Type", { fg = p.cool })
hi("Special", { fg = p.violet })
hi("Underlined", { fg = p.cool, underline = true })
hi("Todo", { fg = p.canvas, bg = p.pink, bold = true })
hi("Error", { fg = p.signal, bold = true })
hi("DiagnosticError", { fg = p.signal })
hi("DiagnosticWarn", { fg = p.pink })
hi("DiagnosticInfo", { fg = p.cool })
hi("DiagnosticHint", { fg = p.violet })
hi("DiffAdd", { fg = p.mint, bg = p.raised })
hi("DiffChange", { fg = p.pink, bg = p.raised })
hi("DiffDelete", { fg = p.signal, bg = p.raised })
hi("DiffText", { fg = p.canvas, bg = p.violet, bold = true })

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

vim.g.terminal_color_0 = p.canvas
vim.g.terminal_color_1 = p.signal
vim.g.terminal_color_2 = p.mint
vim.g.terminal_color_3 = p.pink
vim.g.terminal_color_4 = p.violet
vim.g.terminal_color_5 = p.pink
vim.g.terminal_color_6 = p.cool
vim.g.terminal_color_7 = p.text
vim.g.terminal_color_8 = p.edge
vim.g.terminal_color_9 = p.signal
vim.g.terminal_color_10 = p.mint
vim.g.terminal_color_11 = p.soft
vim.g.terminal_color_12 = p.violet
vim.g.terminal_color_13 = p.pink
vim.g.terminal_color_14 = p.cool
vim.g.terminal_color_15 = p.soft
