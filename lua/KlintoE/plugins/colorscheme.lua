return {
	{
		"AlphaTechnolog/pywal.nvim",
		name = pywal,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("pywal").setup({})
		end,
	},
}
