return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		require("flutter-tools").setup({}) -- use defaults

		-- Show hover
		vim.api.nvim_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

		-- Jump to definition
		vim.api.nvim_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

		-- Open code actions using the default LSP UI
		vim.api.nvim_set_keymap(
			"n",
			"<leader>ca",
			"<Cmd>lua vim.lsp.buf.code_action()<CR>",
			{ noremap = true, silent = true }
		)

		-- Open code actions for the selected visual range
		vim.api.nvim_set_keymap(
			"x",
			"<leader>ca",
			"<Cmd>lua vim.lsp.buf.range_code_action()<CR>",
			{ noremap = true, silent = true }
		)
	end,
}
