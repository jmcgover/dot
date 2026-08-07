return {
	{
		'nvim-telescope/telescope.nvim', -- highly extendable fuzzy finder over lists
		version = '*',
		enabled = true,  -- When false, or if the function returns false, then this plugin will not be included in the spec
		dependencies = {  -- list of plugin names or plugin specs that should be loaded when the plugin loads
			'nvim-lua/plenary.nvim', -- Lua module for asynchronous programming using coroutines
			-- optional but recommended
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
		config = function()  -- executed when the plugin loads
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
			vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope live grep' })
			vim.keymap.set('n', '<leader>ps', function ()
				builtin.grep_string({ search = vim.fn.input("grep > ")});
			end, { desc = 'Telescope grep string' })
		end,
	}
}
