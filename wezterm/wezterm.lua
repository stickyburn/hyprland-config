local wezterm = require 'wezterm'
local act = wezterm.action

return {
  font = wezterm.font 'ZedMono Nerd Font',
  font_size = 11,
  hide_tab_bar_if_only_one_tab = true,
  default_cursor_style = 'SteadyUnderline',
  adjust_window_size_when_changing_font_size = false,
  window_decorations = "NONE",
  dpi = 382,
  colors = {
    background = "#201A2F",
    -- "#221124"
    -- "#201A2F"
    -- "#1D1B28"
    -- "#120F24"
    foreground = "#EDEEFA",
    -- "#DFFFF8"
    -- "#EDEEFA"
    -- "#FF338F"
    cursor_bg = "#D7AFFF",
    tab_bar = {
      background = "#1A1526",
      active_tab = {
        bg_color = "#110e18",
        fg_color = "#DFFFF8",
      },
      inactive_tab = {
        bg_color = "#1A1526",
        fg_color = "#DFFFF8",
      },
      inactive_tab_hover = {
        bg_color = "#1A1526",
        fg_color = "#DFFFF8",
      },
      new_tab = {
        bg_color = "#1A1526",
        fg_color = "#DFFFF8",
      },
      new_tab_hover = {
        bg_color = "#1A1526",
        fg_color = "#DFFFF8",
      },
    },
  },
  use_fancy_tab_bar = false,
  show_new_tab_button_in_tab_bar = false,
  show_tab_index_in_tab_bar = false,
  tab_max_width = 120,
}
