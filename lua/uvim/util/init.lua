-- This file will serve as the Universe class

---@field langs uvim.util.langs
---@field opts uvim.util.opts
---@field root uvim.util.root
local M = {}

setmetatable(M, {
  __index = function(t, k)
    -- Try to load the module only when it's first accessed
    t[k] = require("uvim.util." .. k)
    return t[k]
  end,
})

-- Tells whether a plugin is loaded
function M.is_loaded(name)
  local Config = require("lazy.core.config")
  return Config.plugins[name] and Config.plugins[name]._.loaded
end

return M
