return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = { "nvim-lua/plenary.nvim", "andrew-george/telescope-themes" },
	lazy = true,
	config = function()
		local telescope = require("telescope")

		local builtin_schemes = require("telescope._extensions.themes").builtin_schemes
		telescope.setup({
			extensions = {
				themes = {

					ignore = vim.list_extend(builtin_schemes, { "embark" }),

					enable_preview = true,
					enable_live_preview = true,

					persist = {
						enabled = true,
						path = vim.fn.stdpath("config") .. "/lua/KlintoE/current-theme.lua",
					},
				},
			},
		})
		telescope.load_extension("themes")
	end,
}
