return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		tag = "v0.9.2",
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"elixir",
					"heex",
					"javascript",
					"html",
					"dart",
					"c_sharp",
					"cmake",
					"cpp",
					"vim",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = false },
				additional_vim_regex_highlighting = false,
			})
		end,
	},
}
