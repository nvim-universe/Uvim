return {
  -- mason-vim-dap.nvim allows users to use Mason to install
  -- DAPs and configure them the same way as LSPs.
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "mason.nvim",
    },
    cmd = { "DapInstall", "DapUninstall" },
    opts = {
      automatic_install = true,
      handlers = {},
    },
    config = function() end,
  },
}
