-- LEADER
-- 					*<LocalLeader>* *maplocalleader*
-- <LocalLeader> is just like <Leader>, except that it uses "maplocalleader"
-- instead of "mapleader".  <LocalLeader> is to be used for mappings which are
-- local to a buffer.  Example: >
--       :map <buffer> <LocalLeader>A  oanother line<Esc>
-- <
-- In a global plugin <Leader> should be used and in a filetype plugin
-- <LocalLeader>.  "mapleader" and "maplocalleader" can be equal.  Although, if
-- you make them different, there is a smaller chance of mappings from global
-- plugins to clash with mappings for filetype plugins.  For example, you could
-- keep "mapleader" at the default backslash, and set "maplocalleader" to an
-- underscore.
vim.g.mapleader = " "   -- lazy.nvim sets this up already
-- vim.g.maplocalleader = "\\"
-- Ex-mode
vim.keymap.set("n", "<leader>pv", vim.cmd.Explore, { desc = "netrw-:Explore the current file's directory" })
