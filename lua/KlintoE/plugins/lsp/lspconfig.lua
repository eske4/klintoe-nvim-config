return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			-- Retrieve default capabilities from cmp_nvim_lsp
			local capabilities = cmp_nvim_lsp.default_capabilities()

			local keymap = vim.keymap -- for conciseness
			local opts = { noremap = true, silent = true }

			-- Define the on_attach function to set keybinds and other configurations
			local on_attach = function(client, bufnr)
				opts.buffer = bufnr -- Set buffer-specific options

				-- Set keybinds for LSP actions with descriptions
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references" })
				keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show LSP definitions" })
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show LSP implementations" })
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Show LSP type definitions" })
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions" })
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" })
				keymap.set(
					"n",
					"<leader>D",
					"<cmd>Telescope diagnostics bufnr=0<CR>",
					{ desc = "Show buffer diagnostics" }
				)
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
				keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
				keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
				keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation for what is under cursor" })
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" })
			end

			-- LSP server configurations
			local servers = {
				tsserver = { capabilities = capabilities, on_attach = on_attach },
				html = { capabilities = capabilities, on_attach = on_attach },
				lua_ls = { capabilities = capabilities, on_attach = on_attach },
				clangd = { capabilities = capabilities, on_attach = on_attach },
				["dartls"] = { -- Use quotes for dartls
					capabilities = capabilities,
					on_attach = on_attach,
					cmd = { "dart", "language-server", "--protocol=lsp" }, -- Additional configurations for dartls if needed
					filetypes = { "dart" },
					init_options = {
						onlyAnalyzeProjectsWithOpenFiles = false,
						suggestFromUnimportedLibraries = true,
						closingLabels = true,
						outline = false,
						flutterOutline = false,
					},
					settings = {
						dart = {
							analysisExcludedFolders = dartExcludedFolders,
							updateImportsOnRename = true,
							completeFunctionCalls = true,
							showTodos = true,
						},
					},
				},
			}

			-- Loop through servers and set up configurations
			for server_name, server_setup in pairs(servers) do
				lspconfig[server_name].setup(server_setup)
			end
		end,
	},
}
