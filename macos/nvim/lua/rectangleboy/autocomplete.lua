--  Pilfered and Converted from: https://neovim.io/doc/user/insert/#_7.-insert-mode-completion
--
-- set autocomplete
-- set complete=.^5,w^5,b^5,u^5
-- set completeopt=popup
-- inoremap <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
-- inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

vim.opt.autocomplete = true
vim.opt.complete = ".^5,w^5,b^5,u^5"
vim.opt.completeopt = "popup"

vim.keymap.set('i', '<Tab>', function()
  return vim.fn.pumvisible() == 1 and '<C-n>' or '<Tab>'
end, { expr = true , desc = "find the next match for a word ending at the cursor"})
vim.keymap.set('i', '<S-Tab>', function()
  return vim.fn.pumvisible() == 1 and '<C-p>' or '<S-Tab>'
end, { expr = true , desc = "find the previous match for a word ending at the cursor"})
