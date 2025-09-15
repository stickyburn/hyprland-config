local wezterm = require 'wezterm'
local act = wezterm.action

return {
  font = wezterm.font 'ZedMono Nerd Font',
  font_size = 11,
  hide_tab_bar_if_only_one_tab = true,
  default_cursor_style = 'SteadyUnderline',
  adjust_window_size_when_changing_font_size = false,
  window_decorations = "NONE",
  dpi = 360,
  colors = {
    background = "#221124",
    -- "#1A1526"
    -- "#120F24"
    foreground = "#DFFFF8",
    -- "#DFFFF8"
    -- "#EDEEFA"
    -- "#F7E8EA"
    -- "#FF338F"
    tab_bar = {
      background = "#221124",
      active_tab = {
        bg_color = "#1A0E20",
        fg_color = "#DFFFF8",
      },
      inactive_tab = {
        bg_color = "#221124",
        fg_color = "#DFFFF8",
      },
      inactive_tab_hover = {
        bg_color = "#221124",
        fg_color = "#DFFFF8",
      },
      new_tab = {
        bg_color = "#221124",
        fg_color = "#DFFFF8",
      },
      new_tab_hover = {
        bg_color = "#221124",
        fg_color = "#DFFFF8",
      },
    },
  },
  use_fancy_tab_bar = false,
  show_new_tab_button_in_tab_bar = false,
  show_tab_index_in_tab_bar = false,
  tab_max_width = 120,
}
