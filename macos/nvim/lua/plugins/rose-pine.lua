return
{
	"rose-pine/neovim",  -- All natural pine, faux fur and a bit of soho vibes for the classy minimalist.
	enabled = true,
	name = "rose-pine",
	config = function()
		-- Configure options _before_ setting colorscheme.
		require("rose-pine").setup({
			variant = "moon", -- auto, main, moon, or dawn
			dark_variant = "main", -- main, moon, or dawn
			styles = {
				bold = true,
				italic = true,
				transparency = false,
			},
			palette = {
				-- Override the builtin palette per variant
				-- moon = {
					--     base = '#18191a',
					--     overlay = '#363738',
					-- },
				},
				-- NOTE: Highlight groups are extended (merged) by default. Disable this
				-- per group via `inherit = false`
				highlight_groups = {
					-- Comment = { fg = "foam" },
					-- StatusLine = { fg = "love", bg = "love", blend = 15 },
					-- VertSplit = { fg = "muted", bg = "muted" },
					-- Visual = { fg = "base", bg = "text", inherit = false },
				},
			})
			vim.cmd("colorscheme rose-pine")
		end
	}
