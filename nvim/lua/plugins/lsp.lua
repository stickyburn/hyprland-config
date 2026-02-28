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
        biome = {
          mason = false,
          cmd = { "bun", "/Users/lemonaid/.local/share/bun/bin/biome", "lsp-proxy" },
        },
        cssls = {
          mason = false,
          cmd = { "bun", "/Users/lemonaid/.local/share/bun/bin/css-language-server", "--stdio" },
        },
        tailwindcss = {
          mason = false,
          cmd = { "bun", "/Users/lemonaid/.local/share/bun/bin/tailwindcss-language-server", "--stdio" },
        },
        ts_ls = {
          mason = false,
          cmd = { "bun", "/Users/lemonaid/.local/share/bun/bin/typescript-language-server", "--stdio" },
        },

        -- external uv
        ruff = {
          mason = false,
          cmd = { "/Users/lemonaid/.local/bin/ruff", "server" },
        },
        basedpyright = {
          mason = false,
          cmd = { "/Users/lemonaid/.local/bin/basedpyright-langserver", "--stdio" },
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "basic",
                autoImportCompletions = true,
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
      },
    },
  },
}
