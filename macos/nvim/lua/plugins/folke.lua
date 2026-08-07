return {
    "folke/lazydev.nvim",                  -- properly configures LuaLS for editing your Neovim config by lazily updating your workspace libraries
    {
        "folke/which-key.nvim",            -- shows available keybindings in a popup as you type
        enabled = true,
        dependencies = {                   -- list of plugin names or plugin specs that should be loaded when the plugin loads
            'nvim-mini/mini.icons',        -- icon provider
            'nvim-tree/nvim-web-devicons', -- provides Nerd Font icons (glyphs)
        },
        opts = {
            triggers = {
                { "<leader>", mode = { "n", "v" } },
            },
        },
    },
    {
        "folke/neoconf.nvim", -- manage global and project-local settings
        cmd = "Neoconf",
    },
}
