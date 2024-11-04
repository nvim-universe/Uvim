-- By default, nvim only looks inside config.plugins for plugins and will
-- not search subdirectories.  Therefore, we can provide a list of tuples
-- for nvim to parse subdirectories.  This makes it easier for us to track
-- what plugin does what.  If you want more folders, ensure you add it here
-- so they get processed!
-- (You'll know you did it right when nvim tells you it's processing the new
-- file instantly after you create it.)
return {
  { import = "uvim.plugins.core" },
  { import = "uvim.plugins.extras" },
}
