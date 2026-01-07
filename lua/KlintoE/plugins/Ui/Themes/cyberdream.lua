return {
	"scottmckendry/cyberdream.nvim",
	name = "cyberdream", -- Keep the name for your picker
	lazy = false,
	priority = 1000,
	opts = {
		transparent = true,
		italic_comments = true,
		borderless_pickers = false, -- The futuristic Telescope look
		terminal_colors = true,
	},
	config = function(_, opts)
		require("cyberdream").setup(opts)

		-- Remove the vim.cmd("colorscheme cyberdream") line
		-- This way it stays in your picker but doesn't override
		-- your current saved theme on startup.
	end,
}
