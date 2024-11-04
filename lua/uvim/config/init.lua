local M = {}

_G.Universe = require("uvim.util")

M.version = "1.0.0"
M.did_init = false
Universe.config = M

local defaults = {
  colorscheme = "catppuccin-mocha",
  defaults = {
    autocmds = true,
    keymaps = true,
  },
  icons = {
    ft = {
      octo = "",
    },
    diagnostics = {
      Error = " ",
      Warn = " ",
      Hint = " ",
      Info = " ",
    },
    git = {
      added = " ",
      modified = " ",
      removed = " ",
    },
  },
}

local options

function M.setup(opts)
  options = vim.tbl_deep_extend("force", defaults, opts or {}) or {}

  -- Universe setups
  Universe.opts.setup()
  Universe.root.setup()
  Universe.langs.setup()

  -- Create commands
  vim.api.nvim_create_user_command("Universe", function()
    Universe.opts.show()
  end, { desc = "Manage Uvim configuration" })

  vim.api.nvim_create_user_command("UHealth", function()
    vim.cmd([[Lazy! load all]])
    vim.cmd.checkhealth()
  end, { desc = "Load all plugins and run :checkhealth" })

  vim.api.nvim_create_user_command("ULang", function(opt)
    local lang = opt.args:lower()
    Universe.langs.install(lang)
  end, { nargs = 1, desc = "Install Language Support" })

  -- Startup Lazy
  require("lazy").setup({
    spec = { import = "uvim.plugins" },
    defaults = {
      lazy = false,
      version = false,
    },
    checker = {
      enabled = true,
      notify = true,
    },
    performance = {
      rtp = {
        disabled_plugins = {
          "gzip",
          "netrwPlugin",
          "tarPlugin",
          "tutor",
          "zipPlugin",
        },
      },
    },
  })

  -- Get colorscheme after loading plugins
  if type(M.colorscheme) == "function" then
    M.colorscheme()
  else
    vim.cmd.colorscheme(M.colorscheme)
  end
end

-- Combine options
setmetatable(M, {
  __index = function(_, k)
    if options == nil then
      return vim.deepcopy(defaults)[k]
    end
    return options[k]
  end,
})

return M
