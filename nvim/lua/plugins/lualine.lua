return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local LazyVim = require("lazyvim.util")
      local icons = LazyVim.config.icons

      -- custom display
      -- left
      opts.sections.lualine_c = {
        LazyVim.lualine.root_dir(),
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
      }

      -- center
      -- remove progress/location
      opts.sections.lualine_y = {}
      opts.sections.lualine_x = {}
      -- right
      -- remove clock, keep location
      opts.sections.lualine_z = {
        { "location", padding = { left = 0, right = 1 } },
      }

      return opts
    end,
  },
}
