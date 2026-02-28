return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
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
      -- remove clock, add git and location
      opts.sections.lualine_z = {
        -- git-blame
        {
          function()
            local blame_text = vim.b.gitsigns_blame_line
            if not blame_text or blame_text == "" then
              return ""
            end
            -- truncate
            if #blame_text > 40 then
              blame_text = blame_text:sub(1, 40) .. "..."
            end
            return blame_text
          end,
          cond = function()
            return vim.b.gitsigns_blame_line ~= nil and vim.b.gitsigns_blame_line ~= ""
          end,
        },
        { "location", padding = { left = 0, right = 1 } },
      }

      return opts
    end,
  },
}
