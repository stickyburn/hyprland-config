return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Replace LazyVim's baseline instead of extending it.
      opts.ensure_installed = {
        "bash",
        "css",
        "html",
        "hyprlang",
        "javascript",
        "json",
        "kitty",
        "lua",
        "markdown",
        "markdown_inline",
        "ron",
        "rust",
        "toml",
        "tsx",
        "typescript",
        "vimdoc",
        "zsh",
      }
    end,
  },
}
