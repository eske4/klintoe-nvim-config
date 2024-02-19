return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = true,
	config = function()
		-- set keymaps
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>pf", builtin.find_files)
		vim.keymap.set("n", "<leader>pg", builtin.git_files)
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep >") })
		end)

		-- Register with which-key
		local wk = require("which-key")
		local keymap_desc = {
			["<leader>pf"] = "Find Files",
			["<leader>pg"] = "Git Files",
			["<leader>ps"] = "Grep String",
		}
		wk.register({
			["<leader>p"] = {
				name = "Telescope file finder",
				f = keymap_desc["<leader>pf"],
				g = keymap_desc["<leader>pg"],
				s = keymap_desc["<leader>ps"],
			},
		})
	end,
}
