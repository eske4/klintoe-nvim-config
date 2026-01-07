return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		event = { "BufReadPre", "BufNewFile" },
		-- WARNING: Remember if lsp_lines break, set virtual_text to true can be found in options.lua
		config = function()
			local bin_locations = vim.fn.stdpath("data") .. "/mason/bin/"
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			-- Retrieve default capabilities from cmp_nvim_lsp
			local capabilities = cmp_nvim_lsp.default_capabilities()

			local keymap = vim.keymap -- for conciseness
			local opts = { noremap = true, silent = true }

			-- Define the on_attach function to set keybinds and other configurations
			local on_attach = function(client, bufnr)
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
				keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
				keymap.set("n", "[d", function()
					vim.diagnostic.jump({ count = -1 })
				end, { desc = "Go to previous diagnostic" })
				keymap.set("n", "]d", function()
					vim.diagnostic.jump({ count = 1 })
				end, { desc = "Go to next diagnostic" })
				keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation for what is under cursor" })
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" })
				keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
			end

			-- LSP server configurations
			local servers = {
				ts_ls = { capabilities = capabilities, on_attach = on_attach },
				html = { capabilities = capabilities, on_attach = on_attach },
				lua_ls = { capabilities = capabilities, on_attach = on_attach },
				omnisharp = {
					capabilities = capabilities,
					on_attach = on_attach,
					cmd = { bin_locations .. "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
				},
				clangd = {
					capabilities = capabilities,
					on_attach = on_attach,
					cmd = {
						"clangd",
						"--background-index",
						"--clang-tidy",
						"--header-insertion=iwyu",
						"--completion-style=detailed",
						"--function-arg-placeholders",
						"--fallback-style=llvm",
					},
				},
				vimls = { capabilities = capabilities, on_attach = on_attach },
				cssls = { capabilities = capabilities, on_attach = on_attach },
				somesass_ls = { capabilities = capabilities, on_attach = on_attach },
				pyright = { capabilities = capabilities, on_attach = on_attach },
				yamlls = { capabilities = capabilities, on_attach = on_attach },
				jsonls = { capabilities = capabilities, on_attach = on_attach },
				docker_compose_language_service = { capabilities = capabilities, on_attach = on_attach },
				dockerls = { capabilities = capabilities, on_attach = on_attach },
				neocmakelsp = {
					capabilities = capabilities,
					on_attach = on_attach,
					-- neocmakelsp usually works out of the box with Mason,
					-- but you can add init_options if you want linting/formatting
					init_options = {
						format = { enable = true },
						lint = { enable = true },
					},
				},
				bashls = { capabilities = capabilities, on_attach = on_attach },
				angularls = { capabilities = capabilities, on_attach = on_attach },
				arduino_language_server = { capabilities = capabilities, on_attach = on_attach },
				svelte = { capabilities = capabilities, on_attach = on_attach },
				tailwindcss = { capabilities = capabilities, on_attach = on_attach },
				hls = { capabilities = capabilities, on_attach = on_attach },
			}

			-- Loop through servers and set up configurations
			for server_name, server_setup in pairs(servers) do
				lspconfig[server_name].setup(server_setup)
			end
		end,
	},
}
