return {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
	main = "nvim-silicon",
	config = function()
		require("silicon").setup({
			font = "FiraCode",
			output = (os.getenv("HOME") or os.getenv("USERPROFILE")) .. "/Pictures/Codesnips/" .. os.date(
				"!%Y-%m-%dT%H-%M-%SZ"
			) .. "_code.png",
		})
	end,
}
