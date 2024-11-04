local M = {}

function M.setup()
  -- Get the config files
  require("uvim.config.autocmds")
  require("uvim.config.keymaps")
  require("uvim.config.options")
end

function M.show() end

return M
