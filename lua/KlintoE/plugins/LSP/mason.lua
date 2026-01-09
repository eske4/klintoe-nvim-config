return {
	-- 1. Mason LSP Config
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				},
			},
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				"angularls",
				"arduino_language_server",
				"autotools_ls",
				"bashls",
				"clangd",
				"hls",
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
				"pyright",
				"somesass_ls",
				"ts_ls",
				"vimls",
				"yamlls",
			},
		},
	},

	-- 2. Mason Tool Installer
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				-- Linters/Formatters
				"cmakelang",
				"neocmakelsp",
				"markdownlint",
				"checkstyle",
				"cmakelint",
				"eslint_d",
				"golangci-lint",
				"jsonlint",
				"luacheck",
				"pylint",
				"stylelint",
				"yamllint",
				"hlint",
				"beautysh",
				"black",
				"clang-format",
				"htmlbeautifier",
				"isort",
				"latexindent",
				"prettier",
				"pretty-php",
				"stylua",
				"ormolu",
				-- Debuggers
				"bash-debug-adapter",
				"codelldb",
				"debugpy",
				"java-debug-adapter",
				"js-debug-adapter",
				"kotlin-debug-adapter",
				"netcoredbg",
				"php-debug-adapter",
			},
		},
	},

	-- 3. Mason DAP (Now correctly placed outside the tool-installer table)
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"mfussenegger/nvim-dap",
			"williamboman/mason.nvim",
		},
		opts = {
			automatic_installation = true,
			handlers = {},
			ensure_installed = {},
		},
	},
}
