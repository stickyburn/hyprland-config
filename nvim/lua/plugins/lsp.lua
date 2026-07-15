return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
      },
      servers = {
        -- mason servers
        taplo = {},
        rust_analyzer = {},

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
