return {
	"kylesnowschwartz/cobalt-neon.nvim",
	lazy = false,
	priority = 1000,
	name = "Cobalt neon",
	config = function()
		require("cobalt-neon").setup({
			transparent_mode = true,
			-- your options here
		})
	end,
}
