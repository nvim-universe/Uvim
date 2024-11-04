return {
  -- vim-illuminate allows you to jump to/from references
  -- to variables.  Variables with multiple references
  -- are underlined.  Using <leader>cn and <leader>cp, we can
  -- jump to next and previous references in the same file.
  -- These use lsp, treesitter, and regex to function.
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({
        providers = {
          "lsp",
          "treesitter",
          "regex",
        },
        delay = 100,
        filetype_overrides = {},
      })
    end,
    keys = {
      {
        "<leader>cn",
        function()
          require("illuminate").goto_next_reference(false)
        end,
        desc = "Goto Next Reference",
      },
      {
        "<leader>cp",
        function()
          require("illuminate").goto_prev_reference(false)
        end,
        desc = "Goto Previous Reference",
      },
    },
  },
}
