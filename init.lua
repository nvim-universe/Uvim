-- This ensures lazy.nvim (the nvim package manager) is installed.
-- It can be accessed using :Lazy to show installed packages,
-- packages requiring updates, unused packages, etc.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- All our configs are inside lua/config.
-- Configurations either do it like this or place the configurations here.
require("uvim.config").setup({})
