print(("%s: Hello!"):format(debug.getinfo(1,'S').source))
return {
	{
		'mbbill/undotree', version = '*', -- highly extendable fuzzy finder over lists
		enabled = true,
		config = function()
			-- https://neovim.io/doc/user/options/#'undodir'
			-- 'undodir' 'udir'	string	(default "$XDG_STATE_HOME/nvim/undo//")
			-- https://neovim.io/doc/user/options/#'undofile'
			-- 'undofile' 'udf'	boolean	(default off) ==> local to buffer
			vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
			vim.opt.undofile = true
		end,
	}
}

