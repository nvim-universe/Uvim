return {
  -- toggleterm allows you to spawn a terminal inside
  -- Neovim. This is mainly for edgy.nvim but allows you
  -- to easily run programs without leaving Neovim (especially
  -- good outside a Tmux session).
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {},
    cmd = { "ToggleTerm" },
    keys = {
      { "<C-_>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
    },
  },
}
