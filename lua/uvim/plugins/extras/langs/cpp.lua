return {
  -- Clangd Extensions
  {
    "p00f/clangd_extensions.nvim",
    lazy = true,
    config = function() end,
    opts = {
      inlay_hints = {
        inline = false,
      },
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = Universe.config.icons.diagnostics.Error,
            [vim.diagnostic.severity.WARN] = Universe.config.icons.diagnostics.Warn,
            [vim.diagnostic.severity.HINT] = Universe.config.icons.diagnostics.Hint,
            [vim.diagnostic.severity.INFO] = Universe.config.icons.diagnostics.Info,
          },
        },
      },
      ast = {
        --These require codicons (https://github.com/microsoft/vscode-codicons)
        role_icons = {
          type = "",
          declaration = "",
          expression = "",
          specifier = "",
          statement = "",
          ["template argument"] = "",
        },
        kind_icons = {
          Compound = "",
          Recovery = "",
          TranslationUnit = "",
          PackExpansion = "",
          TemplateTypeParm = "",
          TemplateTemplateParm = "",
          TemplateParamObject = "",
        },
      },
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "cpp" } },
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local lspconfig = require("lspconfig")

      lspconfig.cmake.setup({})

      lspconfig.clangd.setup({
        filetypes = { "h", "c", "cpp", "objc", "objcpp" },
        cmd = {
          "clangd",
          "--compile-commands-dir=cmake-build-debug",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
          "--log=verbose",
        },
        root_dir = function()
          if vim.g.root then
            return vim.g.root
          end
          return lspconfig.util.root_pattern("CMakeLists.txt", ".git")
        end,
        init_options = {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
          semanticHighlighting = true,
        },
        flags = { debounce_text_changes = 150 },
        on_attach = function()
          require("clangd_extensions.inlay_hints").setup_autocmd()
          require("clangd_extensions.inlay_hints").set_inlay_hints()
        end,
      })
    end,
  },

  -- DAP
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      "williamboman/mason.nvim",
      optional = true,
      opts = { ensure_installed = { "codelldb" } },
    },
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
        ensure_installed = { "clang_format" },
      })

      local null_ls = require("null-ls")
      null_ls.setup({
        sources = vim.tbl_deep_extend("force", opts.sources or {}, {
            null_ls.builtins.formatting.clang_format
        }),
      })
    end,
  },
}
