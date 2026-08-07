-- SEARCH HIGHLIGHT
-- 'hlsearch' 'hls'	boolean	(default on)
-- 			global
-- 	When there is a previous search pattern, highlight all its
-- 	matches.
-- 'incsearch' 'is'	boolean	(default on)
-- 			global
-- 	While typing a search command, show where the pattern, as it was
-- 	typed so far, matches.
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- SEARCH CASE
-- If the 'ignorecase' option is on, the case of normal letters is ignored.
-- 'smartcase' can be set to ignore case when the pattern contains lowercase
-- letters only.
vim.opt_local.ignorecase = true
vim.opt_local.smartcase = true

-- TOGGLE HIGHLIGHT
vim.keymap.set("n", '<C-h>', function ()
	if vim.o.hlsearch then
		vim.opt.hlsearch = false
	else
		vim.opt.hlsearch = true
	end
end)

-- TOGGLE IGNORE CASE
vim.keymap.set("n", '<C-c>', function ()
	if vim.o.ignorecase then
		vim.opt.ignorecase = false
	else
		vim.opt.ignorecase = true
	end
end)
