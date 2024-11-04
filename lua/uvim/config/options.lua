-- The leader key.  This key provides access to the rest of nvim's functionality.
-- The most common key used here is <space>.
vim.g.mapleader = " "

vim.g.autoformat = true -- Vim autoformat
vim.g.trouble_lualine = true -- Shows document symbols from Trouble in lualine

-- Making it faster to change the vim options
local opt = vim.opt

opt.autowrite = true -- Enable autowrite
opt.backup = false -- We have undotree, we don't need native backups
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Use global clipboard (+) or ssh clipboard
opt.conceallevel = 2 -- Hide * on markdown for bold/italic, but not markers with substitutions
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Adds highlighting on current cursor line (disabled for better transparent feel)
opt.expandtab = true -- Use spaces instead of tabs
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.foldlevel = 99
opt.hlsearch = false -- Don't keep terms highlighted post-search
opt.incsearch = true -- Highlight as you search
opt.laststatus = 3 -- Global statusline
opt.mouse = "a" -- Enable mouse
opt.number = true -- Show current line number
opt.pumheight = 10 -- Maximum entries per popup
opt.relativenumber = true -- Relative line numbering (better for jk keys)
opt.scrolloff = 8 -- Must show 8 lines when scrolling vertically
opt.showmode = false -- Don't show mode (we have a status line)
opt.shiftwidth = 4 -- Indents are size 4
opt.signcolumn = "yes" -- Make a column for signs
opt.sidescrolloff = 8 -- Must show 8 lines when scrolling horizontally
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Smart indenting
opt.splitbelow = true -- New window below current
opt.splitkeep = "screen" -- Prevent default splitting (edgy)
opt.splitright = true -- New window right of current
opt.swapfile = false -- We have undotree, we don't want a swapfile
opt.tabstop = 4 -- Tabs are 4 spaces
opt.termguicolors = true -- True colors for terminal
opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Store undotree
opt.undofile = true -- Yes, we want undo history
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file faster
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.wrap = false -- Disable line wrap
