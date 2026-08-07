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
-- LSP: lua
-- Install: Global
vim.lsp.config('luals', {
  cmd = {'lua-language-server'},
  filetypes = {'lua'},
  root_markers = {'.luarc.json', '.luarc.jsonc'},
})
vim.lsp.enable('luals')

-- LSP: python
-- Install: Per-Project
