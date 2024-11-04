return {
  -- Add Aerial Module (Symbols Outline)
  {
    "stevearc/aerial.nvim",
    opts = function()
      local icons = vim.deepcopy(Universe.config.icons.kinds)

      local opts = {
        attach_mode = "global",
        backends = { "lsp", "treesitter", "markdown", "man" },
        show_guides = true,
        icons = icons,
      }
      return opts
    end,
    keys = {
      { "<leader>cs", "<cmd>AerialToggle<cr>", desc = "Aerial (Symbols)" },
    },
  },
}
