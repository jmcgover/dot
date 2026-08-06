print(("%s: Hello!"):format(debug.getinfo(1,'S').source))
-- Startup Sequence --
-- lazy.nvim does NOT use Neovim packages and even disables plugin loading completely (vim.go.loadplugins = false).
-- It takes over the complete startup sequence for more flexibility and better performance.
-- In practice this means that step 10 of Neovim Initialization is done by Lazy:
--
-- 1. All the plugins' init() functions are executed
-- 2. All plugins with lazy=false are loaded. This includes sourcing /plugin and /ftdetect files. (/after will not be sourced yet)
-- 3. All files from /plugin and /ftdetect directories in your rtp are sourced (excluding /after)
-- 4. All /after/plugin files are sourced (this includes /after from plugins)
--
-- Files from runtime directories are always sourced in alphabetical order.
--
-- Configuring Plugins --
-- Any lua file in ~/.config/nvim/lua/plugins/*.lua will be automatically merged in the main plugin spec

-- Copied from: https://lazy.folke.io/installation
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

