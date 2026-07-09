local bun_bin = (vim.env.BUN_INSTALL or vim.fn.expand("~/.local/share/bun")) .. "/bin"

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
      },
      format = {
        filter = function(client)
          return client.name ~= "vtsls"
        end,
      },
      servers = {
        -- mason servers
        lua_ls = {},
        taplo = {},
        marksman = {},

        vtsls = {
          mason = false,
          cmd = { bun_bin .. "/vtsls", "--stdio" },
          on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
          settings = {
            typescript = { format = { enable = false } },
            javascript = { format = { enable = false } },
          },
        },
        eslint = {
          mason = false,
          cmd = { bun_bin .. "/vscode-eslint-language-server", "--stdio" },
          settings = {
            format = true,
            workingDirectory = { mode = "auto" },
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
