return {
  -- mini.pairs automatically writes the closing pair for various
  -- opening-closing items.
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {
      modes = { insert = true, command = true, terminal = false },
      skip_ts = { "string" },
      skip_unbalanced = true,
      markdown = true,
    },
  },
  -- Automatically adds closing tags inside HTML and JSX.
  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },
}
