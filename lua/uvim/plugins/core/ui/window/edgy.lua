return {
  -- edgy.nvim provides a more advanced IDE-like window structure
  -- for Neovim.  This is not everyone's cup of tea, but does show
  -- valuable information on the side, including open buffers, the
  -- NeoTree, and the file outline.  These can be opened and closed
  -- as needed.
  -- If you want to change the windows here, simply change what
  -- plugins are being called in the opts below.
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>ue",
        function()
          require("edgy").toggle()
        end,
        desc = "Edgy Toggle",
      },
      {
        "<leader>uE",
        function()
          require("edgy").select()
        end,
        desc = "Edgy Select Window",
      },
    },
    opts = {
      open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "edgy" },
      bottom = {
        -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
        {
          ft = "toggleterm",
          open = "ToggleTerm",
          size = { height = 0.4 },
          -- exclude floating windows
          filter = function(buf, win)
            return vim.api.nvim_win_get_config(win).relative == ""
          end,
        },
        {
          ft = "lazyterm",
          title = "LazyTerm",
          size = { height = 0.4 },
          filter = function(buf)
            return not vim.b[buf].lazyterm_cmd
          end,
        },
        "Trouble",
        { ft = "qf", title = "QuickFix" },
        {
          ft = "help",
          size = { height = 20 },
          -- only show help buffers
          filter = function(buf)
            return vim.bo[buf].buftype == "help"
          end,
        },
        { ft = "spectre_panel", size = { height = 0.4 } },
      },
      left = {
        -- Neo-tree filesystem always takes half the screen height
        {
          title = "Neo-Tree",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "filesystem"
          end,
          size = { height = 0.5 },
        },
        {
          title = "Aerial",
          ft = "aerial",
          pinned = true,
          open = "AerialOpen",
          size = { height = 0.5 },
        },
        -- any other neo-tree windows
        "neo-tree",
      },
    },
  },
}
