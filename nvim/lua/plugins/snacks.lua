return {
  "folke/snacks.nvim",
  opts = {
    indent = { only_scope = true },
    dashboard = { enabled = true },
    notifier = { enabled = true },
    scroll = { enabled = true },
    picker = {
      win = {
        list = {
          keys = {
            -- Colemak: up/down/open/focus-input for all pickers
            ["e"] = "list_up",
            ["i"] = "list_down",
            ["l"] = "focus_input",
            ["o"] = "confirm",
          },
        },
      },
      sources = {
        explorer = {
          layout = {
            preset = "default",
            preview = true,
          },
          auto_close = false,
          jump = { close = true },
          win = {
            list = {
              keys = {
                -- Colemak tree navigation
                ["n"] = "explorer_close", -- left: collapse / parent
                ["e"] = "list_up",        -- up
                ["i"] = "list_down",      -- down
                ["o"] = "confirm",        -- right: expand / open
                ["l"] = "focus_input",    -- filter / insert mode
              },
            },
          },
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
        vim.api.nvim_set_hl(0, "SnacksPickerSelected", { fg = "#221727", bg = "#c79eff", bold = true })
        vim.api.nvim_set_hl(0, "SnacksPickerListCursorLine", { fg = "#221727", bg = "#c79eff" })
        vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = "#c79eff" })
        vim.api.nvim_set_hl(0, "SnacksInputBorder", { fg = "#c79eff" })
        vim.api.nvim_set_hl(0, "SnacksNotifierBorder", { fg = "#c79eff" })
        vim.api.nvim_set_hl(0, "SnacksDashboardBorder", { fg = "#c79eff" })
      end,
    })

    if vim.g.colors_name then
      vim.api.nvim_exec_autocmds("ColorScheme", {})
    end
  end,
}
