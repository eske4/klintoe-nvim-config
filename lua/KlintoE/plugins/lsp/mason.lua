return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},

	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"tsserver",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
				"clangd",
				"vimls",
				"jsonls",
				"lemminx",
				"yamlls",
				"somesass_ls",
				"r_language_server",
				"ltex",
				"autotools_ls",
				"marksman",
				"dockerls",
				"docker_compose_language_service",
				"cmake",
				"csharp_ls",
				"bashls",
				"arduino_language_server",
				"angularls",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint", -- python linter
				"eslint_d", -- js linter
				"clang-format",
				"cmakelang",
				"cmakelint",
				"luacheck",
				"jsonlint",
				"htmlbeautifier",
				"golangci-lint",
				"checkstyle",
				"markdownlint",
				"yamllint",
				"stylelint",
				"beautysh",
				"pretty-php",
				"latexindent",
				"csharpier",
			},
		})

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
	end,
}
