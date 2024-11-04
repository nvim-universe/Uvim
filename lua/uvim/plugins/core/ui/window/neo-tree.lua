return {
  -- neo-tree.nvim provides the directory at the left-side of the window.
  -- It can be opened using <leader>e and closed with the same.
  -- Files can be opened by using <Enter>.  Create a file using 'a'.
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = { "Neotree" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      window = {
        width = 30,
      },
      override_by_filename = {
        [".gitignore"] = {
          icon = "",
          color = "#f1502f",
          name = "Gitignore",
        },
      },
      overide_by_extension = {
        ["asm"] = {
          icon = "",
          color = "#f44336",
          name = "ASM",
        },
      },
    },
    keys = {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.g.root })
        end,
        desc = "Explore NeoTree (root)",
      },
      {
        "<leader>e",
        "<leader>fe",
        desc = "Explore NeoTree (root)",
        remap = true,
      },
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
        end,
        desc = "Explore NeoTree (cwd)",
      },
      {
        "<leader>E",
        "<leader>fE",
        desc = "Explore NeoTree (cwd)",
        remap = true,
      },
      {
        "<leader>ge",
        function()
          require("neo-tree.command").execute({ source = "git_status", toggle = true })
        end,
        desc = "Git Explorer",
      },
      {
        "<leader>be",
        function()
          require("neo-tree.command").execute({ source = "buffers", toggle = true })
        end,
        desc = "Buffer Explorer",
      },
    },
  },
}
