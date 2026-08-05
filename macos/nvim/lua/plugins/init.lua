print(("%s: Hello!"):format(debug.getinfo(1,'S').source))
return {
  "folke/lazydev.nvim",  -- properly configures LuaLS for editing your Neovim config by lazily updating your workspace libraries
  "folke/which-key.nvim", -- shows available keybindings in a popup as you type
  { "folke/neoconf.nvim", cmd = "Neoconf" },  -- manage global and project-local settings
  {
    'nvim-telescope/telescope.nvim', version = '*', -- highly extendable fuzzy finder over lists
    dependencies = {  -- list of plugin names or plugin specs that should be loaded when the plugin loads
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()  -- executed when the plugin loads
	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
	vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope live grep' })
	vim.keymap.set('n', '<leader>ps', function ()
		builtin.grep_string({ search = vim.fn.input("grep > ")});
	end)
    end,
  }
}
