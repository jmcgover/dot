-- LEADER
-- MUST OCCUR BEFORE ANY REMAPS THAT USE <(Local)Leader>
--                  *<LocalLeader>* *maplocalleader*
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
vim.g.mapleader = " "   -- do this before lazy.nvim setup
vim.g.maplocalleader = " "

-- NETRW EXPLORE
--                      *netrw-:Explore*
-- :Explore  will open the local-directory browser on the current file's
--           directory (or on directory [dir] if specified).  The window will be
--    split only if the file has been modified and 'hidden' is not set,
--    otherwise the browsing window will take over that window.  Normally
--    the splitting is taken horizontally.
vim.keymap.set("n", "<leader>pv", vim.cmd.Explore, { desc = "netrw-:Explore the current file's directory" })

-- MOVE BLOCKS
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "move selected lines down" })
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "move selected lines up" })

-- CENTERED CURSOR
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "page down, center cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "page up, center cursor" })
vim.keymap.set("n", "n", "nzzzv", { desc = "next result, center cursor" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "next result, center cursor" })

-- VOID REGISTER
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "place without losing the previous yank" })
vim.keymap.set({"n", "v"}, "<leader>d", '"_d', { desc = "delete without losing the previous yank" })

-- YANK
vim.keymap.set({"n", "v"}, "<leader>y", '"+y', { desc = "yank into system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "y$ into system clipboard" })

-- DISABLE REGISTER REPEAT
vim.keymap.set("n", "Q", "<nop>", { desc = "disable 'repeat the last recorded register [count] times'" })

-- FIND+REPLACE
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "replace current word" })
vim.keymap.set("v", "<leader>s", [["hy:%s/\<<C-r>h\>/<C-r>h/gI<Left><Left><Left>]], { desc = "replace current selection" })

-- FILE PERMISSIONS
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
