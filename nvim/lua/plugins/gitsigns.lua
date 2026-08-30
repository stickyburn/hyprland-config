return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      -- expose current-line blame to lualine instead of inline virtual text
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = false,
        delay = 100,
      },
      current_line_blame_formatter = " <author> · <author_time:%R>",
      -- hide on lines that aren't committed yet
      current_line_blame_formatter_nc = "",
    },
  },
}
