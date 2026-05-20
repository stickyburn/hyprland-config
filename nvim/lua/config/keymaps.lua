-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- quickly open command
map("n", ";", ":", { desc = "CMD enter command mode" })

-- ── Colemak semantic movement ──────────────────────────────
-- n e i o = word back, block up, block down, word forward
map("n", "n", "b", { desc = "← word back" })
map("n", "e", "{", { desc = "↑ block up" })
map("n", "i", "}", { desc = "↓ block down" })
map("n", "o", "w", { desc = "→ word forward" })

-- same in visual mode
map("v", "n", "b", { desc = "← word back" })
map("v", "e", "{", { desc = "↑ block up" })
map("v", "i", "}", { desc = "↓ block down" })
map("v", "o", "w", { desc = "→ word forward" })

-- ── Displaced keys ──────────────────────────────────────────
map("n", "l", "i", { desc = "Insert mode" })          -- i → l
map("n", "<CR>", "o", { desc = "Open line below" })   -- o → Enter

-- search navigation (n is now word back)
map("n", "<leader>n", function() vim.cmd("normal! n") end, { desc = "Next search result" })
map("n", "<leader>N", function() vim.cmd("normal! N") end, { desc = "Previous search result" })

-- quickly escape from insert mode
-- TODO: check perf before enabling
--map("i", "jk", "<ESC>")

-- <D> is the cmd key on macOS
map("n", "<D-o>", function()
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
