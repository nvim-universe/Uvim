return {
  -- undotre will allow for long-term undo support (including across
  -- multiple sessions/days/whatever by using a history file with
  -- edits.
  {
    "mbbill/undotree",
    keys = {
      { "<F5>", vim.cmd.UndotreeToggle, desc = "Toggle Undo Tree" },
    },
  },
}
