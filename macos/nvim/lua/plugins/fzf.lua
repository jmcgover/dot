return {
    {
        "ibhagwan/fzf-lua",         -- a neovim (>0.5) plugin written in lua integrating fzf into the neovim ecosystem.
        enabled = true,
        dependencies = {            -- optional for icon support
            'nvim-mini/mini.icons', -- icon provider
            -- 'nvim-tree/nvim-web-devicons', -- provides Nerd Font icons (glyphs)
        },
        opts = { defaults = { file_icons = "mini" }, },
        config = function()
            local fzflua = require('fzf-lua')
            -- PROJECT SEARCH
            vim.keymap.set('n', '<leader>pf', fzflua.files, { desc = 'find files' })
            vim.keymap.set('n', '<C-p>', fzflua.git_files, { desc = 'find `git ls-files`' })
            vim.keymap.set('n', '<leader>ps', function ()
                fzflua.grep({ search = vim.fn.input("search > ")});
            end, { desc = 'search with (rip)grep' })
            vim.keymap.set('n', '<leader>pl', fzflua.live_grep, { desc = 'live (rip)grep' })

            -- LSP
            vim.keymap.set('n', '<leader>la', fzflua.lsp_code_actions, { desc = 'LSP actions' })
            vim.keymap.set('n', '<leader>lr', fzflua.lsp_references, { desc = 'LSP references' })
            vim.keymap.set('n', '<leader>lt', fzflua.lsp_typedefs, { desc = 'LSP typedefs' })
            vim.keymap.set('n', '<leader>lO', fzflua.lsp_document_symbols, { desc = 'LSP document symbols' })
            vim.keymap.set('n', '<leader>lw', fzflua.lsp_document_symbols, { desc = 'LSP live search workspace symbols' })

            -- MISC
            vim.keymap.set('n', '<leader>u', fzflua.undotree, { desc = "show undo-tree" })
            vim.keymap.set('n', '<leader>k', fzflua.keymaps, { desc = "show keymaps" })

            -- ICONS
            -- checkhealth warns that these aren't loaded, even if I have them installed
            require("mini.icons")
            -- require("nvim-web-devicons")
        end,
    },
}
