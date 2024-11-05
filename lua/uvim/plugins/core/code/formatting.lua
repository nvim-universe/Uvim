return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "jay-babu/mason-null-ls.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-null-ls").setup({})

      local null_ls = require("null-ls")
      null_ls.setup({
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              groups = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
              end,
            })
          end
        end,
      })
    end,
    keys = {
      { "<leader>cf", vim.lsp.buf.format, { description = "Format Buffer" } },
    },
  },
}
