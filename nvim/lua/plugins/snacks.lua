return {
  "folke/snacks.nvim",
  opts = {
    -- Starts Tree-sitter and redraws before showing the file, leading to delays on larger opens.
    quickfile = { enabled = false },
    indent = { only_scope = true },
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
