-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- quickly open command
map("n", ";", ":", { desc = "CMD enter command mode" })

-- quickly escape from insert mode
-- TODO: check perf before enabling
--map("i", "jk", "<ESC>")

-- <D> is the cmd key on macOS
map("n", "<D-e>", function()
  local pickers = Snacks.picker.get({ source = "explorer" })
  local explorer = pickers[1]

  if explorer then
    explorer:close()
  else
    Snacks.explorer()
  end
end, { desc = "Toggle explorer visibility" })

-- toggle statusline visibility
map("n", "<D-S-b>", function()
  if vim.o.laststatus == 0 then
    vim.o.laststatus = 3
  else
    vim.o.laststatus = 0
  end
end, { desc = "Toggle Statusline Visibility" })
