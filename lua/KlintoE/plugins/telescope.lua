return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = true,
	config = function()
		-- set keymaps
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search files" })
		vim.keymap.set("n", "<leader>sg", builtin.git_files, { desc = "Search git files" })
		vim.keymap.set("n", "<leader>ss", function()
			builtin.grep_string({ search = vim.fn.input("Grep >") }, { desc = "Grep string" })
		end)
	end,
}
