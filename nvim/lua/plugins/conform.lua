return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        fish = vim.NIL,
        javascript = { "prettier_config" },
        javascriptreact = { "prettier_config" },
        typescript = { "prettier_config" },
        typescriptreact = { "prettier_config" },
        json = { "prettier_config" },
        jsonc = { "prettier_config" },
        css = { "prettier_config" },
        html = { "prettier_config" },
        rust = { "rustfmt" },
        toml = { "taplo" },
      },
      formatters = {
        prettier_config = {
          inherit = "prettier",
          require_cwd = true,
        },
      },
    },
  },
}
