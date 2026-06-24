return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- mason servers
        lua_ls = {},
        taplo = {},
        marksman = {},

        -- external bun
        vtsls = {
          mason = false,
          cmd = { "bun", vim.env.HOME .. "/.local/share/bun/bin/vtsls", "--stdio" },
        },
        eslint = {
          mason = false,
          cmd = { vim.env.HOME .. "/.local/share/pnpm/vscode-eslint-language-server", "--stdio" },
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "jsonc" },
          settings = {
            format = true,
          },
        },
        cssls = {
          mason = false,
          cmd = { "bun", vim.env.HOME .. "/.local/share/bun/bin/css-language-server", "--stdio" },
        },
        tailwindcss = {
          mason = false,
          cmd = { "bun", vim.env.HOME .. "/.local/share/bun/bin/tailwindcss-language-server", "--stdio" },
        },
      },
    },
  },
}
