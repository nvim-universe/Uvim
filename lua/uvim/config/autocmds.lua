-- This function groups autocommands by namespace.  For example, TextYankPost
-- is the namespace for vim's on_yank functionality.
-- Taken from LazyVim autocmds (https://github.com/LazyVim/LazyVim)
local function augroup(name)
  return vim.api.nvim_create_augroup("uvim_" .. name, { clear = true })
end

-- Highlights text when yanked.
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- check for file reloads when changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

-- set NASM as ASM
vim.cmd([[ autocmd BufRead,BufNewFile *.nasm set filetype=asm ]])

-- wrap and spellcheck in text types
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "text", "plaintext", "typst", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})
