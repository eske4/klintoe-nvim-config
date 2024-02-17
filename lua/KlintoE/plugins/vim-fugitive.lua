return {
	"tpope/vim-fugitive",
	config = function()
		local wk = require("which-key")
		wk.register({
			["g"] = {
				name = "comment and git system",
				c = {
					name = "comment system",
					c = { require("Comment").toggle_comment, "Toggle comment" },
					-- Add more commands under "gcc" if needed
				},
			},
		}, { prefix = "<leader>" })
	end,
}
