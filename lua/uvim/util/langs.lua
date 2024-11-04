local M = {}

local maps = {
  c = "cpp",
  nasm = "asm",
}

local imports = {}

function M.setup()
  -- Get initial file
  local path = vim.fn.stdpath("config") .. "/lua/uvim/plugins/extras/init.lua"
  local file = io.open(path, "r")
  if not file then
    print("No extra plugins list found: " .. path)
    return
  end

  -- Get import filenames
  for line in file:lines() do
    local import = line:match('{ import = "(.-)" }')
    if import then
      table.insert(imports, import)
    end
  end

  file:close()
end

function M.sync()
  -- Open file for writing
  local path = vim.fn.stdpath("config") .. "/lua/uvim/plugins/extras/init.lua"
  local file = io.open(path, "w")
  if not file then
    print("Could not open file: " .. path)
  end

  if file then
    file:write("-- Auto-generated file of registered languages\n")
    file:write("return {\n")

    -- Write each filename
    for _, import in ipairs(imports) do
      file:write(string.format('    { import = "%s" },\n', import))
    end

    file:write("}\n")
    file:close()
  end
end

-- Checks whether a plugin is already registered
-- Used inside M.install(1)
local function registered(registry, name)
  for _, import in ipairs(registry) do
    local plugin = import:match(".*%.(.*)$")
    if plugin == name then
      return true
    end
  end

  return false
end

function M.install(lang)
  local name = maps[lang] or lang
  name = string.lower(name)

  if not registered(imports, name) then
    -- Add to imports table
    local langfile = "uvim.plugins.extras.langs." .. name
    table.insert(imports, langfile)
    M.sync()

    -- Success message
    print("Successfully registered " .. name)
    print("Please restart Neovim to apply changes.")
  else
    print(lang .. " is already registered!")
  end
end

return M
