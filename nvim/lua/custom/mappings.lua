---@type MappingsTable
local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
		["<leader>lg"] = {
			function()
				local term = require("nvterm.terminal").new("float")
				vim.api.nvim_chan_send(term.job_id, "lazygit\n")
			end,
			"open Lazygit",
		},
	},
}

return M
