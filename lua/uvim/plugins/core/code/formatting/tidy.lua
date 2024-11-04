return {
  -- tidy.nvim removes trailing whitespace and improves
  -- on-save formatting for all file types.
  {
    "mcauley-penney/tidy.nvim",
    opts = {
      enabled_on_save = true,
      filetype_exclude = {},
    },
  },
}
