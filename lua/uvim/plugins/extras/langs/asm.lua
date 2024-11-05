return {
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "asm", "nasm" } },
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function(_, opts)
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "asm-lsp" },
      })

      lspconfig.lua_ls.setup({ capabilities = capabilities })
    end,
  },

  -- Formatting and Linting
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "jay-babu/mason-null-ls.nvim",
    },
    config = function(_, opts)
      require("mason").setup()
      require("mason-null-ls").setup({
        ensure_installed = { "asmfmt" },
      })

      local null_ls = require("null-ls")
      null_ls.setup({
        sources = vim.tbl_deep_extend("force", opts.sources or {}, {
            null_ls.builtins.formatting.asmfmt
        }),
      })
    end,
  },
}
