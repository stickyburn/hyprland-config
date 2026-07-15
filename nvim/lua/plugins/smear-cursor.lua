return {
  "sphamba/smear-cursor.nvim",
  event = "VeryLazy",
  opts = function()
    return {
      cursor_color = require("config.palette").pink,
      stiffness = 0.72,
      trailing_stiffness = 0.52,
      damping = 0.86,
      anticipation = 0.25,
      distance_stop_animating = 0.08,
    }
  end,
}
