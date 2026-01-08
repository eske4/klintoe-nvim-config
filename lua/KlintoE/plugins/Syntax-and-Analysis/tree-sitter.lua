return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		-- Remove 'event' and 'cmd' if you want it to install parsers immediately on startup
		lazy = false,
		config = function()
			local ts = require("nvim-treesitter")

			-- 1. Run the standard setup (for highlight/indent)
			ts.setup({
				highlight = { enable = true },
				indent = { enable = true },
			})

			-- 2. Define your list
			local ensure_installed = {
				"bash",
				"c",
				"cpp",
				"diff",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"printf",
				"python",
				"query",
				"regex",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
			}

			-- 3. Trigger the install manually for missing parsers
			-- This replaces the old 'ensure_installed' behavior
			ts.install(ensure_installed)
		end,
	},
}
