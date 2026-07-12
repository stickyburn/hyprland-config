-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Force background color to match kitty terminal
local bg = "#0e0f10"
local modal_bg = "#0e0f10"

local function set_bg()
  vim.api.nvim_set_hl(0, "Normal", { bg = bg })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = bg })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = bg })
  vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = bg, fg = bg })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = bg })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = bg })

  -- Modals and picker windows
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = modal_bg })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = modal_bg, fg = "#eee9ff" })
  vim.api.nvim_set_hl(0, "FloatTitle", { bg = modal_bg, fg = "#eee9ff" })
  vim.api.nvim_set_hl(0, "SnacksPickerNormal", { bg = modal_bg })
  vim.api.nvim_set_hl(0, "SnacksPickerBorder", { bg = modal_bg, fg = "#eee9ff" })

  -- Override lualine highlight backgrounds to match
  for _, name in ipairs(vim.fn.getcompletion("lualine_", "highlight")) do
    local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
    if ok and type(hl) == "table" then
      hl.bg = tonumber(bg:sub(2), 16)
      vim.api.nvim_set_hl(0, name, hl)
    end
  end
end

set_bg()

vim.api.nvim_create_augroup("CustomBg", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  group = "CustomBg",
  pattern = "*",
  callback = set_bg,
})

-- Which-key sidebar uses main background instead of modal bg
vim.api.nvim_set_hl(0, "WhichKeyNormal", { bg = bg })
vim.api.nvim_create_autocmd("FileType", {
  group = "CustomBg",
  pattern = "which-key",
  callback = function()
    vim.wo.winhl = "NormalFloat:WhichKeyNormal,Normal:WhichKeyNormal"
  end,
})
