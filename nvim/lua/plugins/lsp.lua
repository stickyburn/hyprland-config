local bun_bin = vim.env.BUN_INSTALL .. "/bin"

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- mason servers
        lua_ls = {},
        taplo = {},
        marksman = {},

        vtsls = {
          mason = false,
          cmd = { bun_bin .. "/vtsls", "--stdio" },
        },
        eslint = {
          mason = false,
          cmd = { bun_bin .. "/vscode-eslint-language-server", "--stdio" },
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "jsonc" },
          settings = {
            format = true,
          },
        },
        cssls = {
          mason = false,
          cmd = { bun_bin .. "/css-language-server", "--stdio" },
        },
        tailwindcss = {
          mason = false,
          cmd = { bun_bin .. "/tailwindcss-language-server", "--stdio" },
        },
      },
    },
  },
}
