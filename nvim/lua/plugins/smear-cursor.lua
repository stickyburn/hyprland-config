return {
  "sphamba/smear-cursor.nvim",
  event = "VeryLazy",
  opts = {
    cursor_color = "#ff91c3",
    stiffness = 0.72,
    trailing_stiffness = 0.52,
    damping = 0.86,
    anticipation = 0.25,
    distance_stop_animating = 0.08,
    smear_between_buffers = true,
    smear_between_neighbor_lines = true,
    scroll_buffer_space = true,
    legacy_computing_symbols_support = false,
    smear_insert_mode = true,
  },
}
