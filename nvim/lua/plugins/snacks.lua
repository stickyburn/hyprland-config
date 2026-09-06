return {
  "folke/snacks.nvim",
  opts = {
    -- Starts Tree-sitter and redraws before showing the file, leading to delays on larger opens.
    quickfile = { enabled = false },
    indent = { only_scope = true },
    lazygit = {
      theme = {
        activeBorderColor = { fg = "FloatBorder", bold = true },
        inactiveBorderColor = { fg = "HyprwayLazygitInactiveBorder" },
        searchingActiveBorderColor = { fg = "Keyword", bold = true },
        optionsTextColor = { fg = "FloatBorder" },
        -- Preserve diff foregrounds while distinguishing selection from the float.
        selectedLineBgColor = { bg = "HyprwayLazygitSelection", bold = true },
        inactiveViewSelectedLineBgColor = { bg = "NormalFloat" },
      },
    },
    picker = {
      win = {
        list = {
          keys = {
            -- Colemak: up/down/open/focus-input for all pickers
            ["e"] = "list_up",
            ["i"] = "list_down",
            ["l"] = "focus_input",
            ["o"] = "confirm",
          },
        },
      },
      sources = {
        explorer = {
          layout = {
            preset = "default",
            preview = true,
          },
          jump = { close = true },
          win = {
            list = {
              keys = {
                -- Colemak tree navigation
                ["n"] = "explorer_close", -- left: collapse / parent
                ["o"] = "confirm", -- right: expand / open
                ["l"] = "focus_input", -- filter / insert mode
              },
            },
          },
        },
      },
    },
  },
}
