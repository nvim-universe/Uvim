return {
  -- telescope.nvim, arguably the most useful plugin here, provides
  -- support for finding files, live grep, git status, and other diagnostics.
  -- Commands can be found below but primarily are inside <leader>f and
  -- <leader>s.
  -- The most common are:
  -- * <leader>ff: Find files by name
  -- * <leader>fg: Live grep anything in any file (grep -r "")
  -- * <leader>gs: Git status
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    keys = {
      { "<leader>,", "<cmd>Telescope buffers sort_mru=true, sort_lastused=true<cr>", desc = "Switch Buffer" },
      -- find
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files({ cwd = vim.g.root })
        end,
        desc = "Find Files (root)",
      },
      { "<leader>fF", "<cmd>Telescope find_files<cr>", desc = "Find Files (cwd)" },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep({ cwd = vim.g.root })
        end,
        desc = "Live Grep (root)",
      },
      { "<leader>fG", "<cmd>Telescope live_grep<cr>", desc = "Live Grep (cwd)" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      -- git
      { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Commits" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Status" },
      -- search
      { '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
      { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
      { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
      { "<leader>sj", "<cmd>Telescope jumplist<cr>", desc = "Jumplist" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
      { "<leader>sl", "<cmd>Telescope loclist<cr>", desc = "Location List" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
      { "<leader>sN", "<cmd>Telescope notify<cr>", desc = "Notification History" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
      { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
      { "<leader>sq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix List" },
    },
  },
}
