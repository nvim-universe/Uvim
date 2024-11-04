return {
  -- mason.nvim drives installation and management of Language Server
  -- Protocol (LSP) servers. LSP Servers are responsible for providing
  -- errors, warning, and other feedback while coding.  In Neovim, we
  -- are responsible for installing and managing these directly.
  {
    "williamboman/mason.nvim",
    lazy = false,
    cmd = "Mason",
    build = ":MasonUpdate",
    opts_extend = { "ensure_installed" },

    -- We need a base table
    opts = {
      ensure_installed = {
        "stylua",
        "lua-language-server",
        "luacheck",
      },
      log_level = vim.log.levels.DEBUG,
    },

    config = function(_, opts)
      require("mason").setup(opts)
      local reg = require("mason-registry")

      -- Refresh buffers that might benefit
      reg:on("package:install:success", function()
        vim.defer_fn(function()
          require("lazy.core.handler.event").trigger({
            event = "FileType",
            buf = vim.api.nvim_get_current_buf(),
          })
        end, 100)
      end)

      -- Install new tools on refresh
      reg.refresh(function()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = reg.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end)
    end,
  },
  -- mason-lspconfig.nvim is the bridge between mason.nvim and
  -- nvim-lspconfig, which ensures they work together to provide LSP
  -- support for installed language servers.
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      auto_install = true,
      PATH = "skip",
      ui = {
        icons = {
          package_pending = " ",
          package_installed = " ",
          package_uninstalled = " ",
        },
      },
      max_concurrent_installers = 10,
    },
  },
  -- nvim-lspconfig is the driver behind LSP servers and makes communication
  -- between the code and language server.  As you change code, changes are
  -- communicated to/from the language server to provide feedback as you type
  -- and are displayed inside normal mode.
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function(opts)
      -- Install lua by default (mainly for testing)
      Universe.langs.install("lua")

      -- Setup autocomplete
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_cmp and cmp_nvim_lsp.default_capabilities() or {},
        opts.capabilities or {}
      )

      -- Get mason servers
      local has_mason, mlsp = pcall(require, "mason-lspconfig")
      if has_mason then
        mlsp.setup({
          ensure_installed = opts.ensure_installed,
        })
      end
    end,
    keys = {
      { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
      { "gd", vim.lsp.buf.definition, desc = "Goto Definition" },
      { "gr", vim.lsp.buf.references, desc = "References", nowait = true },
      { "gI", vim.lsp.buf.implementation, desc = "Goto Implementation" },
      { "gy", vim.lsp.buf.type_definition, desc = "Goto T[y]pe Definition" },
      { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
      { "K", vim.lsp.buf.hover, desc = "Hover" },
      { "gK", vim.lsp.buf.signature_help, desc = "Signature Help" },
      { "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help" },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" } },
      { "<leader>cc", vim.lsp.codelens.run, desc = "Run Codelens", mode = { "n", "v" } },
      { "<leader>cC", vim.lsp.codelens.refresh, desc = "Refresh & Display Codelens", mode = { "n" } },
      { "<leader>cr", vim.lsp.buf.rename, desc = "Rename" },
    },
  },
}
