return {
  -- markdown-preview.nvim supports the live updating of
  -- Markdown files inside a web browser.
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.cmd([[Lazy load markdown-preview.nvim]])
      vim.fn["mkdp#util#install"]()
    end,
  },
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
