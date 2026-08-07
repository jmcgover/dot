-- LINE NUMBER
function SetAbsoluteLineNumber()
	vim.opt_local.relativenumber = false
	vim.opt_local.number = true
end
function SetRelativeLineNumber()
	vim.opt_local.relativenumber = true
	vim.opt_local.number = true
end
vim.keymap.set("n", '<C-n>', function ()
	if vim.bo.relativenumber then
        SetAbsoluteLineNumber()
	else
        SetRelativeLineNumber()
	end
end)

-- DEFAULT ON OPEN
vim.opt.relativenumber = true
vim.opt.number = true
-- AUTO SWITCH
-- Relative Line Numbering:
--   - Pane In Focus
--   - When in Edit Mode
-- Absolute Line Numbering:
--   - Pane Out of Focus
--   - When in Insert Mode
vim.api.nvim_create_autocmd({'WinLeave', 'InsertEnter'}, {callback = function() 
    SetAbsoluteLineNumber()
end})
vim.api.nvim_create_autocmd({'WinEnter', 'InsertLeave'}, {callback = function() 
    SetRelativeLineNumber()
end})
-- switches to absolute when in insert
