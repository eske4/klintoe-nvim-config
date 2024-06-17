return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")
		local wk = require("which-key")

		local mappings = {
			{ mode = "n", keys = "<leader>hm", func = mark.add_file, desc = "Add file to navigator" },
			{ mode = "n", keys = "<leader>ho", func = ui.toggle_quick_menu, desc = "Open navigator menu" },
		}

		local keymap_desc = {}

		for _, mapping in ipairs(mappings) do
			vim.keymap.set(mapping.mode, mapping.keys, mapping.func, { desc = mapping.desc })
			table.insert(keymap_desc, { mapping.key, mapping.desc })
		end

		wk.register({
			["<leader>h"] = {
				name = "Harpoon navigation menu",
				keymap_desc,
			},
		})
	end,
}

