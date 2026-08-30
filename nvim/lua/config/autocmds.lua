-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- gitsigns blame is async and doesn't redraw the statusline itself
local blame_redraw_timer = assert((vim.uv or vim.loop).new_timer())
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "BufEnter", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("blame_statusline_redraw", { clear = true }),
  callback = function()
    blame_redraw_timer:stop()
    blame_redraw_timer:start(250, 0, vim.schedule_wrap(function()
      vim.cmd.redrawstatus()
    end))
  end,
})
