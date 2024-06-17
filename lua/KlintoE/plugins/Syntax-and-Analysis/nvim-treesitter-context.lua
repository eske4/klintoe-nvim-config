return {
	"nvim-treesitter/nvim-treesitter-context",

	config = function()
		-- WARNING: disable on markdown files to avoid error spamming as it gets buggy on tripleticks

		vim.cmd([[
        autocmd FileType * lua require('treesitter-context').enable()
        ]])

		vim.cmd([[
        autocmd FileType markdown lua require('treesitter-context').disable()
        ]])
	end,
}
