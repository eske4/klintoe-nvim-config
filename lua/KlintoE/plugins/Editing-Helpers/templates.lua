return {
	"glepnir/template.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	cmd = { "Template", "TemProject" },
	config = function()
		require("template").setup({
			-- config in there
			temp_dir = vim.fn.stdpath("config") .. "/templates",
			author = "KlintoE",
			email = "eske.larsen@gmail.com",
		})
		require("telescope").load_extension("find_template")
	end,
}
