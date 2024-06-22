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
		"alfaix/neotest-gtest",
		"rcasia/neotest-java",
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
				require("neotest-gtest"),
				require("neotest-bash"),
				require("neotest-java"),
				require("neotest-phpunit"),
				require("neotest-rust"),
			},
		})
	end,
}
