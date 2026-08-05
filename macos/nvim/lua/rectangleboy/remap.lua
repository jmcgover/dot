print(("%s: Hello!"):format(debug.getinfo(1,'S').source))
-- vim.g.mapleader = " "   -- lazy.nvim sets this up already
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
