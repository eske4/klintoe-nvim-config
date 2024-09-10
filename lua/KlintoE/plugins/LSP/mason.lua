return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"mfussenegger/nvim-dap",
		"jay-babu/mason-nvim-dap.nvim",
	},

	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")
		local mason_dap = require("mason-nvim-dap")

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
			-- Language servers
			ensure_installed = {
				"angularls",
				"arduino_language_server",
				"autotools_ls",
				"bashls",
				"clangd",
				"hls",
				"cmake",
				"omnisharp",
				"cssls",
				"docker_compose_language_service",
				"dockerls",
				"emmet_ls",
				"graphql",
				"html",
				"jsonls",
				"lemminx",
				"ltex",
				"lua_ls",
				"marksman",
				"prismals",
				"pyright",
				"r_language_server",
				"somesass_ls",
				"svelte",
				"tailwindcss",
				"tsserver",
				"vimls",
				"yamlls",
				-- auto-install configured servers (with lspconfig)
			},
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {

				-- Formatter and Linters
				"cmakelang", -- CMake
				"markdownlint", --Markdown

				-- Linters
				"checkstyle", -- Overall
				"cmakelint", -- CMake
				"eslint_d", -- Javascript and more
				"golangci-lint", -- Golang
				"jsonlint", -- Json
				"luacheck", -- Lua
				"pylint", -- Python
				"stylelint", -- CSS/SCSS etc
				"yamllint", -- Yaml
				"hlint", --Haskell

				-- Formatters
				"beautysh", --Shell
				"black", -- python
				"clang-format", --C/C++
				"csharpier", --C#
				"htmlbeautifier", -- HTML
				"isort", -- python
				"latexindent", --Latex
				"prettier",
				"pretty-php", --PHP
				"stylua", -- lua
				"ormolu", -- Haskell

				-- Debugger adapters
				"bash-debug-adapter", -- Shell
				"codelldb", -- C/C++/Rust
				"debugpy", -- Python
				"java-debug-adapter", -- Java
				"js-debug-adapter", -- Javascript
				"kotlin-debug-adapter", -- Kotlin
				"netcoredbg", -- C#
				"php-debug-adapter", -- PHP
			},
		})
	end,
}
