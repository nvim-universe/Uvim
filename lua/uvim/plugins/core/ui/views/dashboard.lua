return {
  -- dashboard.nvim is the dashboard you see when you first
  -- open nvim. There are two modes: hyper and doom. These
  -- are better explained on the dashboard-nvim repo.
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      local opts = {
        theme = "hyper",
        hide = { statusline = false },
        config = {
          week_header = { enable = true },
          shortcut = {
            {
              icon = "󰊳 ",
              desc = " Update",
              group = "@property",
              action = "Lazy update",
              key = "u",
            },
            {
              icon = " ",
              icon_hl = "@variable",
              desc = "Files",
              group = "Label",
              action = "Telescope find_files",
              key = "f",
            },
            {
              icon = " ",
              desc = "Grep",
              group = "String",
              action = "Telescope live_grep",
              key = "g",
            },
            {
              icon = " ",
              desc = "Restore",
              group = "Number",
              action = 'require("persistence").load({last = true})',
              key = "q",
            },
          },
        },
      }
      return opts
    end,
  },
}
