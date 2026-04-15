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
        biome = {
          mason = false,
          cmd = { "bun", vim.env.HOME .. "/.local/share/bun/bin/biome", "lsp-proxy" },
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "jsonc", "css" },
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
