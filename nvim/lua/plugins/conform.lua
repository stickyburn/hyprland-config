return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- JS/TS are handled by the ESLint LSP server so it uses the project's own ESLint version
        json = { "prettier" },
        jsonc = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        lua = { "stylua" },
        toml = { "taplo" },
      },
      formatters = {
        prettier = {
          command = vim.env.HOME .. "/.local/share/pnpm/prettier",
        },
      },
    },
  },
}
