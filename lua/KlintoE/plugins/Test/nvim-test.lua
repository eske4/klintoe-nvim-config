return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-python",
		"sidlatau/neotest-dart",
		"olimorris/neotest-phpunit",
		"Issafalcon/neotest-dotnet",
		"rouge8/neotest-rust",
		"orjangj/neotest-ctest",
		"rcasia/neotest-bash",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python"),
				require("neotest-dart")({
					command = "flutter",
					use_lsp = false,
				}),
				require("neotest-dotnet"),
				require("neotest-ctest"),
				require("neotest-bash"),
				require("neotest-phpunit"),
				require("neotest-rust"),
			},
		})
	end,
}
