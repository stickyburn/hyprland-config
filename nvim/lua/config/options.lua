-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- paths for Bun-managed editor tooling, used for LSPs and formatters
local data_home = vim.env.XDG_DATA_HOME or (vim.env.HOME .. "/.local/share")
local cache_home = vim.env.XDG_CACHE_HOME or (vim.env.HOME .. "/.config/.cache")
vim.env.BUN_INSTALL = vim.env.BUN_INSTALL or (data_home .. "/bun")
vim.env.BUN_INSTALL_CACHE_DIR = vim.env.BUN_INSTALL_CACHE_DIR or (cache_home .. "/bun/install/cache")
vim.env.PATH = vim.env.BUN_INSTALL .. "/bin:" .. vim.env.PATH

-- line numbers
vim.opt.number = false
vim.opt.relativenumber = false

-- sign gutters
vim.opt.signcolumn = "no"
