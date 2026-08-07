-- The nvim-treesitter plugin provides: 
--   - functions for installing, updating, and removing tree-sitter parsers; 
--   - a collection of queries for enabling tree-sitter features built into
--     Neovim for these languages; 
--   - a staging ground for treesitter-based features considered for
--     upstreaming to Neovim.
-- Requirements
--   - Neovim 0.12.0 or later (nightly)
--   - tar and curl in your path
--   - tree-sitter-cli (0.26.1 or later, installed via your package manager, not npm)
--   - a C compiler in your path (see https://docs.rs/cc/latest/cc/#compile-time-requirements)

return {
	'nvim-treesitter/nvim-treesitter',
	enabled = true,
	lazy = false,
	build = function()
		TS = require('nvim-treesitter')
		TS.update()
	end,
	config = function()
		TS = require('nvim-treesitter')
		TS.install({
			"bash",
			"c",
			"cpp",
			"csv",
			"diff",
			"ecma", -- queries required by javascript, typescript, tsx, qmljs
			"gdscript", -- Godot
			"gdshader",
			"gnuplot",
			"gnuplot",
			"go",
			"godot_resource", -- Godot Resources
			"html",
			"http",
			"java",
			"javadoc",
			"javascript",
			"jinja", -- basic highlighting
			"jinja_inline", -- needed for full highlighting
			"jsdoc",
			"jsdoc",
			"json",
			"jsx", -- queries required by javascript, tsx
			"just",
			"latex",
			"llvm",
			"lua",
			"luadoc",
			"luap", -- Lua patterns
			"make",
			"markdown", -- basic highlighting
			"markdown_inline", -- needed for full highlighting
			"mermaid",
			"objc",
			"printf",
			"properties", -- Java properties files
			"python",
			"query",
			"query", -- Tree-sitter query language
			"r",
			"racket",
			"regex",
			"scala",
			"sql",
			"ssh_config",
			"swift",
			"toml",
			"tsv",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"xml",
			"yaml",
			"zsh",
		})
		TS.update()
	end,
}
