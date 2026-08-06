print(("%s: Hello!"):format(debug.getinfo(1,'S').source))
-- STARTUP SEQUENCE
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
-- CONFIGURING PLUGINS
-- Any lua file in ~/.config/nvim/lua/plugins/*.lua will be automatically merged in the main plugin spec
--
-- COMMANDS
-- Command			Lua				Description
-- :help lazy.nvim						Open the vimdoc for lazy.nvim
-- :Lazy build {plugins}	require("lazy").build(opts)	Rebuild a plugin
-- :Lazy check [plugins]	require("lazy").check(opts?)	Check for updates and show the log (git fetch)
-- :Lazy clean [plugins]	require("lazy").clean(opts?)	Clean plugins that are no longer needed
-- :Lazy clear			require("lazy").clear()		Clear finished tasks
-- :Lazy debug			require("lazy").debug()		Show debug information
-- :Lazy health			require("lazy").health()	Run :checkhealth lazy
-- :Lazy help			require("lazy").help()		Toggle this help page
-- :Lazy home			require("lazy").home()		Go back to plugin list
-- :Lazy install [plugins]	require("lazy").install(opts?)	Install missing plugins
-- :Lazy load {plugins}		require("lazy").load(opts)	Load a plugin that has not been loaded yet. Similar to :packadd. Like :Lazy load foo.nvim. Use :Lazy! load to skip cond checks.
-- :Lazy log [plugins]		require("lazy").log(opts?)	Show recent updates
-- :Lazy profile		require("lazy").profile()	Show detailed profiling
-- :Lazy reload {plugins}	require("lazy").reload(opts)	Reload a plugin (experimental!!)
-- :Lazy restore [plugins]	require("lazy").restore(opts?)	Updates all plugins to the state in the lockfile. For a single plugin: restore it to the state in the lockfile or to a given commit under the cursor
-- :Lazy sync [plugins]		require("lazy").sync(opts?)	Run install, clean and update
-- :Lazy update [plugins]	require("lazy").update(opts?)	Update plugins. This will also update the lockfile
--
-- BOOTSTRAP --
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

