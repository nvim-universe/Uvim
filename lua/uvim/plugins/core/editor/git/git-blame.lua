return {
  -- git blame provides "git lens" esque support inside Neovim,
  -- showing who made the change on CursorLine.
  -- This plugin is not for everyone, so easily disable it by
  -- setting enabled = false below.
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
      enabled = true,
      message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message
      date_format = "%m-%d-%Y %H:%M:%S", -- template for the date
      virtual_text_column = 1,
    },
  },
}
