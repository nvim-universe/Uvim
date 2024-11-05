local cmp_kinds = {
  Text = "  ",
  Method = "  ",
  Function = "  ",
  Constructor = "  ",
  Field = "  ",
  Variable = "  ",
  Class = "  ",
  Interface = "  ",
  Module = "  ",
  Property = "  ",
  Unit = "  ",
  Value = "  ",
  Enum = "  ",
  Keyword = "  ",
  Snippet = "  ",
  Color = "  ",
  File = "  ",
  Reference = "  ",
  Folder = "  ",
  EnumMember = "  ",
  Constant = "  ",
  Struct = "  ",
  Event = "  ",
  Operator = "  ",
  TypeParameter = "  ",
}

return {
  -- nvim-cmp is the Neovim autocomplete plugin. It provides a context window that works with
  -- the LSPs to allow autocompletion. You can scroll using <Up>/<Down> or <Tab>/<S-Tab> and
  -- select with <Enter>. I have "select only choice with enter" turned off because it bothers
  -- me, but can be turned on at line 61.
  {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "petertriho/cmp-git",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    opts = function(_, opts)
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      require("luasnip.loaders.from_vscode").lazy_load()

      return {
        auto_brackets = {},

        completion = {
          completeopt = "menu,menuone,noinsert" .. (autoselect and "" or ",noselect"),
        },

        preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,

        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              local entries = cmp.get_entries()
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })

              if #entries == 1 then
                cmp.confirm()
              end
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              local entries = cmp.get_entries()
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })

              if luasnip.jumpable(-1) then
                luasnip.jump(-1)
              end
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
          { name = "git" },
        }, {
          { name = "buffer" },
        }),

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        formatting = {
          format = function(_, vim_item)
            vim_item.kind = (cmp_kinds[vim_item.kind] or "") .. vim_item.kind
            return vim_item
          end,
        },

        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
        sorting = {
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.recently_used,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
      }
    end,
  },
}
