-- NETRW EXPLORE
--                      *netrw-:Explore*
-- :Explore  will open the local-directory browser on the current file's
--           directory (or on directory [dir] if specified).  The window will be
--    split only if the file has been modified and 'hidden' is not set,
--    otherwise the browsing window will take over that window.  Normally
--    the splitting is taken horizontally.
vim.keymap.set("n", "<leader>pv", vim.cmd.Explore, { desc = "netrw-:Explore the current file's directory" })
