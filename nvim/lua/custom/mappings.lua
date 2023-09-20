local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } }
  }
}

-- M.nvterm = {
--   plugin = true,
--   n = {
--     -- toggle in normal mode
--     ["<A-h>"] = {
--       function()
--         require("nvterm.terminal").toggle "float"
--       end,
--       "Toggle floating term",
--     },
--   }
-- }

return M
