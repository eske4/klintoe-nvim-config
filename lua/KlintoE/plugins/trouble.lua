return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("trouble").setup({
			icons = false,
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		})

		-- Lua
		vim.keymap.set("n", "<leader>tt", function()
			require("trouble").toggle()
		end, { desc = "whole project diagnosis" })
		vim.keymap.set("n", "<leader>tw", function()
			require("trouble").toggle("workspace_diagnostics")
		end, { desc = "workspace diagnosis" })
		vim.keymap.set("n", "<leader>td", function()
			require("trouble").toggle("document_diagnostics")
		end, { desc = "document diagnosis" })
		vim.keymap.set("n", "<leader>tl", function()
			require("trouble").toggle("loclist")
		end, { desc = "loclist diagnosis" })
	end,
}
