-- Language Server Protocol (LSP)
-- COMMANDS: jump
--                          *CTRL-O*
-- CTRL-O           Go to [count] Older cursor position in jump list
-- 
-- <Tab>        or                  *CTRL-I* *<Tab>*
-- CTRL-I           Go to [count] newer cursor position in jump list
-- COMMANDS: lsp
-- GLOBAL DEFAULTS                       *gra* *gri* *grn* *grr* *grt* *grx* *i_CTRL-S*
-- 
-- These GLOBAL keymaps are created unconditionally when Nvim starts:
-- - "gra" (Normal and Visual mode) is mapped to |vim.lsp.buf.code_action()|
-- - "gri" is mapped to |vim.lsp.buf.implementation()|
-- - "grn" is mapped to |vim.lsp.buf.rename()|
-- - "grr" is mapped to |vim.lsp.buf.references()|
-- - "grt" is mapped to |vim.lsp.buf.type_definition()|
-- - "grx" is mapped to |vim.lsp.codelens.run()|
-- - "gO" is mapped to |vim.lsp.buf.document_symbol()|
-- - CTRL-S (Insert mode) is mapped to |vim.lsp.buf.signature_help()|
-- - |v_an| and |v_in| fall back to LSP |vim.lsp.buf.selection_range()| if
--   treesitter is not active.
-- - |gx| handles `textDocument/documentLink`. Example: with gopls, invoking gx
--   on "os" in this Go code will open documentation externally: >
--     package nvim
--     import (
--        "os"
--     )
--
-- FORMAT
vim.keymap.set('n', '<C-b>', '<Plug>(nvim.lsp.ctrl-s)', {desc = "Displays signature information about the symbol under the cursor in a floating window."})

vim.keymap.set('n', '<C-k>', function() 
    vim.lsp.buf.format({ async = false })
end, {desc = "Formats a buffer using the attached (and optionally filtered) language server clients."})

-- LANGUAGE: lua
-- Install: Global
-- SERVER: luals
vim.lsp.config('luals', {
  cmd = {'lua-language-server'},
  filetypes = {'lua'},
  root_markers = {'.luarc.json', '.luarc.jsonc'},
})

-- LANGUAGE: python
-- Install: Per-Project
-- SERVER: ruff
vim.lsp.config('ruff', {
    cmd = { 'ruff', 'server' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', },
    init_options = {
        settings = {
            logLevel = 'debug',
        }
    }
})
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end
    if client.name == 'ruff' then
      -- Disable hover in favor of Pyright
      client.server_capabilities.hoverProvider = false
    end
  end,
  desc = 'LSP: Disable hover capability from Ruff',
})
-- SERVER: pylsp

-- ENABLE
vim.lsp.enable('luals')
vim.lsp.enable('ruff')
