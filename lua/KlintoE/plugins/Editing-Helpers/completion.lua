return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		lspkind.init({})

		-- Function to compute max width as a percentage of the screen width
		local function main_menu_max_width()
			return math.floor(0.3 * vim.o.columns) -- 50% of the screen width
		end

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			experimental = {
				ghost_text = true,
			},

			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			window = {
				completion = cmp.config.window.bordered({}),
				documentation = cmp.config.window.bordered(),
			},

			mapping = cmp.mapping.preset.insert({
				["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<ESC>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
			}),
			-- configure lspkind for vs-code like pictograms in completion menu

			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol", -- show only symbol annotations
					ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part will show ellipsis_char instead
					menu = {
						buffer = "[buf]",
						nvim_lsp = "[LSP]",
						nvim_lua = "[api]",
						path = "[path]",
						luasnip = "[snip]",
					},
					show_labelDetails = true,
					before = function(entry, vim_item)
						local width = main_menu_max_width()
						if #vim_item.abbr > width then
							vim_item.abbr = string.sub(vim_item.abbr, 1, width - 3) .. "..."
						end
						if vim_item.menu then
							local detail_width = width - #vim_item.kind - 3 -- Adjusting for kind and ellipsis
							if #vim_item.menu > detail_width then
								vim_item.menu = string.sub(vim_item.menu, 1, detail_width) .. "..."
							end
						end
						return vim_item
					end,
				}),
			},
		})
	end,
}
