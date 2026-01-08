local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Simplified bootstrap
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "KlintoE.plugins.LSP" },
	{ import = "KlintoE.plugins.Ui" },
	{ import = "KlintoE.plugins.Ui.Themes" },
	{ import = "KlintoE.plugins.Motions" },
	{ import = "KlintoE.plugins.Debuggers" },
	{ import = "KlintoE.plugins.Editing-Helpers" },
	{ import = "KlintoE.plugins.Games" },
	{ import = "KlintoE.plugins.Git-Integrations" },
	{ import = "KlintoE.plugins.Syntax-and-Analysis" },
	{ import = "KlintoE.plugins.Linters" },
	{ import = "KlintoE.plugins.Lang-Frameworks" },
	{ import = "KlintoE.plugins.Test" },
}, {
	checker = { enabled = true, notify = false },
	change_detection = { notify = false },
})
