return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      italic_comments = true,
      hide_fillchars = true,
      borderless_telescope = false,
      terminal_colors = true,
      cache = false,
      theme = {
        variant = "default",
        overrides = function()
          return {
            CursorLineNr = { fg = "#FFD700", bg = "NONE" },
          }
        end,
      },
      extensions = {
        telescope = true,
        notify = true,
        lazy = true,
        mini = true,
      },
    },
  },
}
