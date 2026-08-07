-- CLOSING
-- nvim_create_user_command is too restrictive with its command name (e.g. cmd
-- must start capitalized, does not respect trailing !, cannot end in !, etc.)
vim.cmd([[
:command WQA wqa
:command WQa wqa
:command Wqa wqa
:command QA qa
:command Qa qa
:command WA wa
:command Wa wa
:command WQ wq
:command Wq wq
:command W w
:command Q q
]])
