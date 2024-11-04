local M = {}

-- store terminal instances
local term = {}

function M.setup(shell)
  vim.o.shell = shell or vim.o.shell
  -- TODO: add windows/pwsh support
end

function M.spawn(cmd, opts)
  local key = vim.inspect({ cmd = cmd or "shell", cwd = opts.cwd, env = opts.env })

  -- check for existing terminal
  if term[key] and vim.api.nvim_buf_is_valid(term[key].buf) then
    -- if window is valid, toggle visibility
    if vim.api.nvim_win_is_valid(term[key].win) then
      vim.api.nvim_win_hide(term[key].win)
    else
      -- recreate window if closed but buffer exists
      local width = math.floor(vim.o.columns * 0.9)
      local height = math.floor(vim.o.lines * 0.9)
      term[key].win = vim.api.nvim_open_win(term[key].buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = math.floor((vim.o.lines - height) / 2),
        col = math.floor((vim.o.columns - width) / 2),
        border = "rounded",
      })
    end
  else
    -- create terminal
    local buf = vim.api.nvim_create_buf(false, true)
    local width = math.floor(vim.o.columns * 0.9)
    local height = math.floor(vim.o.lines * 0.9)
    local win = vim.api.nvim_open_win(buf, true, {
      relative = "editor",
      width = width,
      height = height,
      row = math.floor((vim.o.lines - height) / 2),
      col = math.floor((vim.o.columns - width) / 2),
      border = "rounded",
    })
    term[key] = { buf = buf, win = win }

    -- set buffer
    vim.fn.termopen(cmd or vim.o.shell, {
      on_exit = function()
        vim.api.nvim_buf_delete(buf, { force = true })
      end,
    })
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.cmd("startinsert")

    -- start writing immediately
    vim.api.nvim_create_autocmd("BufEnter", {
      buffer = buf,
      callback = function()
        vim.cmd.startinsert()
      end,
    })

    vim.cmd("noh")
  end

  return term[key]
end

return M
