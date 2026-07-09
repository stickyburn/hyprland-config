local bun_bin = (vim.env.BUN_INSTALL or vim.fn.expand("~/.local/share/bun")) .. "/bin"

return {
  {
    "stevearc/conform.nvim",
    opts = {
      default_format_opts = { timeout_ms = 10000, lsp_format = "fallback" },
      formatters_by_ft = {
        javascript = { "prettier_config", lsp_format = "first" },
        javascriptreact = { "prettier_config", lsp_format = "first" },
        typescript = { "prettier_config", lsp_format = "first" },
        typescriptreact = { "prettier_config", lsp_format = "first" },
        json = { "prettier" },
        jsonc = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        lua = { "stylua" },
        toml = { "taplo" },
      },
      formatters = {
        prettier = {
          command = function(self, ctx)
            return require("conform.util").find_executable({ "node_modules/.bin/prettier" }, bun_bin .. "/prettier")(
              self,
              ctx
            )
          end,
        },
        prettier_config = {
          inherit = "prettier",
          require_cwd = true,
        },
      },
    },
  },
}
