return {
  -- obsidian.nvim provides Obsidian support for Neovim.
  -- This is for personal use, so it's in extras and ignored
  -- by git.
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        name = "vault",
        path = "~/Documents/Obsidian Vault/",
      },
    },
  },
}
