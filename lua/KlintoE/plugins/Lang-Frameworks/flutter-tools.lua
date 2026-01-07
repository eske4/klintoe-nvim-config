return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("flutter-tools").setup({

			lsp = {

				on_attach = function(client, bufnr)
					-- Set keybinds for LSP actions with descriptions
					vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references" })
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
					vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show LSP definitions" })
					vim.keymap.set(
						"n",
						"gi",
						"<cmd>Telescope lsp_implementations<CR>",
						{ desc = "Show LSP implementations" }
					)
					vim.keymap.set(
						"n",
						"gt",
						"<cmd>Telescope lsp_type_definitions<CR>",
						{ desc = "Show LSP type definitions" }
					)
					vim.keymap.set(
						{ "n", "v" },
						"<leader>ca",
						vim.lsp.buf.code_action,
						{ desc = "See available code actions" }
					)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" })
					vim.keymap.set(
						"n",
						"<leader>D",
						"<cmd>Telescope diagnostics bufnr=0<CR>",
						{ desc = "Show buffer diagnostics" }
					)
					vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
					vim.keymap.set(
						"n",
						"[d",
						vim.Diagnostic.jump({ count = -1 }),
						{ desc = "Go to previous diagnostic" }
					)
					vim.keymap.set("n", "]d", vim.Diagnostic.jump({ count = 1 }), { desc = "Go to next diagnostic" })
					vim.keymap.set(
						"n",
						"K",
						vim.lsp.buf.hover,
						{ desc = "Show documentation for what is under cursor" }
					)
					vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" })
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
				end,
			},
		}) -- use defaults
	end,
}
