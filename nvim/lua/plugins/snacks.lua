return {
  "folke/snacks.nvim",
  opts = {
    indent = { only_scope = true },
    dashboard = { enabled = true },
    notifier = { enabled = true },
    scroll = { enabled = true },
    picker = {
      sources = {
        explorer = {
          layout = {
            preset = "default",
            preview = true,
          },
          auto_close = false,
          jump = { close = true },
        },
      },
    },
  },
  config = function(_, opts)
    require("snacks").setup(opts)

    -- Set custom colors for snacks highlight groups
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = vim.api.nvim_create_augroup("SnacksCustomColors", { clear = true }),
      callback = function()
        vim.api.nvim_set_hl(0, "SnacksPickerSelected", { bg = "#2a1d31" })
        vim.api.nvim_set_hl(0, "SnacksPickerListCursorLine", { bg = "#2a1d31" })
        vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = "#cfaaf3" })
        vim.api.nvim_set_hl(0, "SnacksInputBorder", { fg = "#cfaaf3" })
        vim.api.nvim_set_hl(0, "SnacksNotifierBorder", { fg = "#cfaaf3" })
        vim.api.nvim_set_hl(0, "SnacksDashboardBorder", { fg = "#cfaaf3" })
      end,
    })

    if vim.g.colors_name then
      vim.api.nvim_exec_autocmds("ColorScheme", {})
    end
  end,
}
