local installed = {
  "bash",
  "c",
  "cpp",
  "diff",
  "html",
  "javascript",
  "json",
  "latex",
  "lua",
  "markdown",
  "python",
  "regex",
  "rust",
  "typescript",
  "vim",
  "vimdoc",
}

return {
  -- nvim-treesitter provides better syntax highlighting by
  -- installing language packs and then turning code into an
  -- Abstract Syntax Tree (AST).  It then highlights text based
  -- on what it is (function, variable, string, etc).
  -- Use :TSInstall to install language packs.  :TSInstall all
  -- is not a bad idea...
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = "VeryLazy",
    lazy = vim.fn.argc(-1) == 0,
    init = function(plugin)
      require("lazy.core.loader").add_to_rtp(plugin)
      require("nvim-treesitter.query_predicates")
    end,
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    keys = {
      { "<c-space>", desc = "Increment Selection" },
      { "<bs>", desc = "Decrement Selection", mode = "x" },
    },
    opts_extend = { "ensure_installed" },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = installed,
    },
  },
  -- nvim-treesitter-textobjects provides better support for
  -- text objects to ensure the treesitter is accurate.
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "VeryLazy",
    enabled = true,
  },
}
