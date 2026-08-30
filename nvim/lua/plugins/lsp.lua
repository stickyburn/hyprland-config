return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
        -- hide hint signs in the gutter (LazyVim's hint icon is a lightbulb)
        signs = {
          severity = { min = vim.diagnostic.severity.INFO },
        },
      },
      servers = {
        -- mason servers
        taplo = {},
        rust_analyzer = { mason = false },

        vtsls = {
          mason = false,
          on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
        },
        eslint = {
          mason = false,
        },
        cssls = {
          mason = false,
        },
        tailwindcss = {
          mason = false,
        },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    enabled = false,
  },
}
