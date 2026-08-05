print(("%s: Hello!"):format(debug.getinfo(1,'S').source))
-- Any lua file in ~/.config/nvim/lua/plugins/*.lua will be automatically merged in the main plugin spec
return {
  "folke/lazydev.nvim",  -- properly configures LuaLS for editing your Neovim config by lazily updating your workspace libraries
  "folke/which-key.nvim", -- shows available keybindings in a popup as you type
  { "folke/neoconf.nvim", cmd = "Neoconf" },  -- manage global and project-local settings
}
