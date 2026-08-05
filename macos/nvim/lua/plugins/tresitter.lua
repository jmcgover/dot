print(("%s: Hello!"):format(debug.getinfo(1,'S').source))
-- The nvim-treesitter plugin provides: 
--   - functions for installing, updating, and removing tree-sitter parsers; 
--   - a collection of queries for enabling tree-sitter features built into
--     Neovim for these languages; 
--   - a staging ground for treesitter-based features considered for
--     upstreaming to Neovim.
return {
	'nvim-treesitter/nvim-treesitter',
	enabled = true,
	lazy = false,
	build = ':TSUpdate'
}

