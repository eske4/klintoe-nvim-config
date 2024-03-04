local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "KlintoE.plugins" }, { import = "KlintoE.plugins.lsp" } }, {
	install = {
		-- colorscheme = { "rose-pine/neovim", name = "rose-pine" },
		colorscheme = { "AlphaTechnolog/pywal.nvim", name = "pywal" },
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
