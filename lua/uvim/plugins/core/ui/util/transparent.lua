return {
  -- transparent.nvim aides in providing a transparent Neovim window.  It is
  -- off by default but enabled by :TransparentEnable.  :TransparentToggle
  -- and :TransprentDisable perform their respective actions.
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    opts = {
      groups = {
        "Normal",
        "CursorLine",
        "CursorLineNr",
        "Float",
        "Pmenu",
        "NormalFloat",
      },
      on_clear = function() end,
    },
  },
}
