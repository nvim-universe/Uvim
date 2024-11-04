local M = {}

M.check = function()
  -- Start Checkup for Lazytown
  vim.health.start("Uvim")

  -- Check Neovim Version
  if vim.fn.has("nvim-0.9.0") == 1 then
    vim.health.ok("Using nvim >= 0.9.0")
    if vim.fn.has("nvim-0.10.0") == 0 then
      vim.health.warn("Use nvim >= 0.10.0 for full feature set")
    end
  else
    vim.health.error("nvim >= 0.9.0 is required")
  end

  -- -- Check for installed requirements
  -- for _, cmd in ipairs({ "git", "rg" }) do
  --     local name
end

return M
