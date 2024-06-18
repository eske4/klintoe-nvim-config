-- Define key mappings with which-key descriptions
local wk = require("which-key")

-- Git mappings
wk.register({
	["<leader>g"] = {
		name = "Git",
		b = { ":Neogit<cr>", "Start git menu" },
		h = { ":DiffviewFileHistory<cr>", "Look at git file history" },
		["s"] = {
			name = "Gitsigns",
			s = { ":Git<cr>", "Git status" },
			n = { ":lua require('gitsigns').next_hunk()<cr>", "Next hunk" },
			u = { ":lua require('gitsigns').undo_stage_hunk()<cr>", "Undo stage hunk" },
			r = { ":lua require('gitsigns').reset_hunk()<cr>", "Reset hunk" },
			f = { ":lua require('gitsigns').diffthis('~1')<cr>", "Diff this" },
			t = { ":TodoTelescope<cr>", "Search TodoList" },
			b = { ":lua require('gitsigns').blame_line()<cr>", "Blame line" },
		},
	},
})

-- Analysis mappings
wk.register({
	["<leader>a"] = {
		name = "Analysis commands",
		l = {
			function()
				require("lint").try_lint()
			end,
			"Trigger linting for current file",
		},
	},
})

-- Diagnostics commands
wk.register({
	["<leader>t"] = {
		name = "Diagnostics",
		t = { "<cmd>Trouble diagnostics toggle<CR>", "Diagnostics" },
		f = { "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", "Buffer Diagnostics (Trouble)" },
		s = { "<cmd>Trouble symbols toggle focus=false<CR>", "Symbols (Trouble)" },
		l = {
			"<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
			"LSP Definitions / references / ... (Trouble)",
		},
		L = { "<cmd>Trouble loclist toggle<CR>", "Location List (Trouble)" },
		Q = { "<cmd>Trouble qflist toggle<CR>", "Quickfix List (Trouble)" },
	},
})

-- Workspace commands: new tabs, terminals etc
wk.register({
	["<leader>w"] = {
		name = "Workspace settings",
		["p"] = {
			name = "panel",
			h = { ":split<cr>", "New panel horizontal" },
			v = { ":vsplit<cr>", "New panel vertical" },
		},
		["d"] = {
			name = "Diagnostics",
			l = {
				function()
					local virtual_text = vim.diagnostic.config().virtual_text
					if virtual_text == nil then
						virtual_text = false
					end
					vim.diagnostic.config({ virtual_text = not virtual_text })
					require("lsp_lines").toggle()
				end,
				"Toggle Lsp_lines, which put diagnostics under code lines",
			},
		},
	},
})

-- Navigation commands things to switch between files
wk.register({
	["<leader>n"] = {
		name = "Navigate",
		d = { ":Oil<cr>", "Navigate directory" },
		["f"] = {
			name = "find",
			t = { ":TodoTelescope<cr>", "Navigate TodoList" },
			f = { ":lua require('telescope.builtin').find_files()<CR>", "Navigate files" },
			g = { ":lua require('telescope.builtin').git_files()<CR>", "Navigate git files" },
			s = {
				":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep > ') })<CR>",
				"Find words",
			},
		},
		["h"] = {
			name = "Harpoon",
			m = {
				function()
					require("harpoon.mark").add_file()
				end,
				"Mark file",
			},
			o = {
				function()
					require("harpoon.ui").toggle_quick_menu()
				end,
				"Open menu",
			},
		},
	},
})

-- Debugger commands
wk.register({
	["<leader>d"] = {
		name = "Debugger",
		t = { ":lua require('dap').toggle_breakpoint()<cr>", "Toggle breakpoint for debugger" },
		b = { ":lua require('dap').set_breakpoint()<cr>", "Set breakpoint" },
		c = { ":lua require('dap').continue()<cr>", "Start debugger/continue" },
		q = {
			"<cmd>lua require('dap').disconnect({ terminateDebuggee = true })<CR><cmd>lua require('dapui').close()<CR>",
			"Quit debugger",
		},
		r = { ":lua require('dap').restart()<cr>", "Restart debugger" },
		["s"] = {
			name = "Step",
			i = { ":lua require('dap').step_into()<cr>", "Step into" },
			o = { ":lua require('dap').step_over()<cr>", "Step over" },
			O = { ":lua require('dap').step_out()<cr>", "Step over" },
			c = { ":lua require('dap').restart()<cr>", "Step to cursor" },
		},
	},
})

-- Focus commands for now
wk.register({
	["<leader>f"] = {
		name = "Focus mode currently",

		["m"] = {
			name = "Focus modes",
			t = { ":Twilight<cr>", "Twillight mode focus on what is hovered" },
			z = { ":ZenMode<cr>", "ZenMode remove all distractions and area smaller" },
		},
	},
})

-- Edit commands
wk.register({
	["<leader>e"] = {
		name = "Edit commands",
		["d"] = {
			name = "Delete commands",
			v = { '"_d<cr>', "Delete to the void", mode = { "v", "n" } },
		},
		["p"] = {
			name = "Paste",
			v = { '"_dP', "Paste then content to void" },
		},
		x = { "<cmd>!chmod +x %<CR>", "Make the file executable" },
		f = {
			function()
				require("conform").format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end,
			"Trigger formatting manually",
		},
		r = {
			name = "replace",
		},
		["t"] = {
			name = "Templates",
			c = { "<cmd>Telescope find_template<CR>", "Check templates" },
			i = { "<cmd>Telescope find_template type=insert<CR>", "Insert template" },
		},
	},
})

vim.keymap.set(
	"n",
	"<leader>erw",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace every word, only in current document" }
)

-- Enables copy so it can paste outside of neovim
wk.register({
	["<leader>y"] = { '"+y', "Copy to clipboard outside of nvim", mode = { "v", "n" } },
	["<leader>Y"] = { '"+Y', "Copy to clipboard outside of nvim" },
})

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "undo tree toggle" })

-- Search commands
wk.register({
	["<leader>s"] = {
		name = "Search",
		["f"] = {
			name = "Flash searching",
			s = {
				function()
					require("flash").jump()
				end,
				"Flash jump",
			},
			t = {
				function()
					require("flash").treesitter()
				end,
				"Flash Treesiter / highlight block of code",
			},
			T = {
				function()
					require("flash").treesitter_search()
				end,
				"Flash telescope search",
			},
		},
	},
})

-- Fold shortcut to open or fold functions etc
vim.keymap.set("n", "<C-f>", "za") -- Fold or unfold

vim.keymap.set("n", "<C-7>", '<cmd>exe v:count1 . "ToggleTerm"<CR>')
vim.keymap.set("i", "<C-7>", '<cmd>exe v:count1 . "ToggleTerm"<CR>')

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
