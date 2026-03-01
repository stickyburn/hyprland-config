return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "biome" },
        javascriptreact = { "biome" },
        typescript = { "biome" },
        typescriptreact = { "biome" },
        json = { "biome" },
        jsonc = { "biome" },
        css = { "biome" },
        html = { "biome" },
        lua = { "stylua" },
        python = { "ruff" },
        toml = { "taplo" },
      },
      formatters = {
        biome = {
          command = "bun",
          args = { "/Users/lemonaid/.local/share/bun/bin/biome", "format", "--stdin-file-path", "$FILENAME" },
        },
      },
    },
  },
}
