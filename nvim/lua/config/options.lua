-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- paths for bun and uv, used for LSPs
vim.env.PATH = vim.env.PATH .. ":/Users/lemonaid/.local/share/bun/bin:/Users/lemonaid/.local/bin"

-- line numbers
vim.opt.number = false
vim.opt.relativenumber = false

-- sign gutters
vim.opt.signcolumn = "no"
