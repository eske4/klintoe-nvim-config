-- Define key mappings with which-key descriptions
local wk = require("which-key")

-- Git mappings
wk.add({
	{
		{ "<leader>g", group = "Git" },
		{ "<leader>gb", ":Neogit<cr>", desc = "Start git menu" },
		{ "<leader>gh", ":DiffviewFileHistory<cr>", desc = "Look at git file history" },
		{ "<leader>gs", group = "Gitsigns" },
		{ "<leader>gsb", ":lua require('gitsigns').blame_line()<cr>", desc = "Blame line" },
		{ "<leader>gsf", ":lua require('gitsigns').diffthis('~1')<cr>", desc = "Diff this" },
		{ "<leader>gsn", ":lua require('gitsigns').next_hunk()<cr>", desc = "Next hunk" },
		{
			"<leader>gsr",
			":lua require('gitsigns').                │          reset_hunk()<cr>",
			desc = "Reset hunk",
		},
		{ "<leader>gss", ":Git<cr>", desc = "Git status" },
		{ "<leader>gst", ":TodoTelescope<cr>", desc = "Search      │          TodoList" },
		{ "<leader>gsu", ":lua require('gitsigns').undo_stage_hunk()<cr>", desc = "Undo stage hunk" },
	},
})

-- Analysis mappings
wk.add({
	{
		{ "<leader>a", group = "Analysis commands" },
		{
			"<leader>l",
			function()
				require("lint").try_lint()
			end,
			desc = "Trigger linting for current file",
		},
	},
})

wk.add({
	{ "<leader>i", group = "Inspection and testing" },
	{ "<leader>it", group = "Test" },
	{ "<leader>iw", group = "Watch/Test UI" },
	{ "<leader>itn", "<cmd>lua require('neotest').run.run()<CR>", desc = "Run the nearest test" },
	{
		"<leader>itc",
		"<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
		desc = "Run test on the current file",
	},
	{ "<leader>itd", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>", desc = "Debug the nearest test" },
	{ "<leader>its", "<cmd>lua require('neotest').run.stop()<CR>", desc = "Stop nearest test" },
	{ "<leader>ita", "<cmd>lua require('neotest').run.attach()<CR>", desc = "Attach to nearest test" },
	{ "<leader>iwc", "<cmd>lua require('neotest').watch.toggle(vim.fn.expand('%'))<CR>", desc = "Watch current file" },
	{
		"<leader>iwo",
		"<cmd>lua require('neotest').output.open({ enter = true })<CR>",
		desc = "Show output window of test",
	},
	{ "<leader>iws", "<cmd>lua require('neotest').summary.toggle()<CR>", desc = "Show summary of test" },
	{ "<leader>iwp", "<cmd>lua require('neotest').output_panel.toggle()<CR>", desc = "Show output panel of test" },
})

-- Diagnostics commands
wk.add({
	{ "<leader>t", group = "Diagnostics" },
	{ "<leader>tt", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics" },
	{ "<leader>tf", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer Diagnostics (Trouble)" },
	{ "<leader>ts", "<cmd>Trouble symbols toggle focus=false<CR>", desc = "Symbols (Trouble)" },
	{
		"<leader>tl",
		"<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
		desc = "LSP Definitions / references / ...",
	},
	{ "<leader>tL", "<cmd>Trouble loclist toggle<CR>", desc = "Location List (Trouble)" },
	{ "<leader>tQ", "<cmd>Trouble qflist toggle<CR>", desc = "Quickfix List (Trouble)" },
})

-- Workspace commands: new tabs, terminals, etc
wk.add({
	{ "<leader>w", group = "Workspace settings" },
	{ "<leader>wp", group = "Panel" },
	{ "<leader>wd", group = "Diagnostics" },
	{ "<leader>wph", ":split<cr>", desc = "New panel horizontal" },
	{ "<leader>wpv", ":vsplit<cr>", desc = "New panel vertical" },
	{
		"<leader>wdl",
		function()
			local virtual_text = vim.diagnostic.config().virtual_text
			if virtual_text == nil then
				virtual_text = false
			end
			vim.diagnostic.config({ virtual_text = not virtual_text })
			require("lsp_lines").toggle()
		end,
		desc = "Toggle Lsp_lines, which put diagnostics under code lines",
	},
	{ "<leader>wt", "<cmd>Telescope themes<CR>", desc = "Switch color scheme" },
})

-- Navigation commands things to switch between files
wk.add({
	{ "<leader>n", group = "Navigate" },
	{ "<leader>nf", group = "Find" },
	{ "<leader>nh", group = "Harpoon" },
	{ "<leader>nd", ":Oil<cr>", desc = "Navigate directory" },
	{
		"<leader>nn",
		function()
			local config_dir = vim.fn.stdpath("config")
			vim.cmd.edit(config_dir)
		end,
		desc = "Go to neovim config",
	},
	{ "<leader>nft", ":TodoTelescope<cr>", desc = "Navigate TodoList" },
	{ "<leader>nff", ":lua require('telescope.builtin').find_files()<CR>", desc = "Navigate files" },
	{ "<leader>nfg", ":lua require('telescope.builtin').git_files()<CR>", desc = "Navigate git files" },
	{
		"<leader>nfs",
		":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep > ') })<CR>",
		desc = "Find words",
	},
	{
		"<leader>nhm",
		function()
			require("harpoon.mark").add_file()
		end,
		desc = "Mark file",
	},
	{
		"<leader>nho",
		function()
			require("harpoon.ui").toggle_quick_menu()
		end,
		desc = "Open menu",
	},
})

-- Debugger commands
wk.add({
	{ "<leader>d", group = "Debugger" },
	{ "<leader>ds", group = "Step" },
	{ "<leader>dt", ":lua require('dap').toggle_breakpoint()<cr>", desc = "Toggle breakpoint for debugger" },
	{ "<leader>db", ":lua require('dap').set_breakpoint()<cr>", desc = "Set breakpoint" },
	{ "<leader>dc", ":lua require('dap').continue()<cr>", desc = "Start debugger/continue" },
	{
		"<leader>dq",
		"<cmd>lua require('dap').disconnect({ terminateDebuggee = true })<CR><cmd>lua require('dapui').close()<CR>",
		desc = "Quit debugger",
	},
	{ "<leader>dr", ":lua require('dap').restart()<cr>", desc = "Restart debugger" },
	{ "<leader>dsi", ":lua require('dap').step_into()<cr>", desc = "Step into" },
	{ "<leader>dso", ":lua require('dap').step_over()<cr>", desc = "Step over" },
	{ "<leader>dsO", ":lua require('dap').step_out()<cr>", desc = "Step out" },
	{ "<leader>dsc", ":lua require('dap').restart()<cr>", desc = "Step to cursor" },
})

-- Focus commands for now
wk.add({
	{ "<leader>f", group = "Focus mode currently" },
	{ "<leader>fm", group = "Focus modes" },
	{ "<leader>fmt", ":Twilight<cr>", desc = "Twillight mode focus on what is hovered" },
	{ "<leader>fmz", ":ZenMode<cr>", desc = "ZenMode remove all distractions and area smaller" },
})

-- Edit commands
wk.add({
	{ "<leader>e", group = "Edit commands" },
	{ "<leader>ed", group = "Delete commands" },
	{ "<leader>ep", group = "Paste" },
	{ "<leader>er", group = "Replace" },
	{ "<leader>et", group = "Templates" },
	{ "<leader>edv", '"_d<cr>', desc = "Delete to the void", mode = { "v", "n" } },
	{ "<leader>epv", '"_dP', desc = "Paste then content to void" },
	{ "<leader>ex", "<cmd>!chmod +x %<CR>", desc = "Make the file executable" },
	{
		"<leader>ef",
		function()
			require("conform").format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end,
		desc = "Trigger formatting manually",
	},
	{ "<leader>etc", "<cmd>Telescope find_template<CR>", desc = "Check templates" },
	{ "<leader>eti", "<cmd>Telescope find_template type=insert<CR>", desc = "Insert template" },
	{ "<leader>es", "<cmd>Silicon<CR>", desc = "Make a code snippet image", mode = { "v" } },
})

vim.keymap.set(
	"n",
	"<leader>erw",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace every word, only in current document" }
)

-- Enables copy so it can paste outside of neovim
wk.add({
	{ "<leader>y", '"+y', desc = "Copy to clipboard outside of nvim", mode = { "v", "n" } },
	{ "<leader>Y", '"+Y', desc = "Copy to clipboard outside of nvim" },
})

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undo tree toggle" })

-- Search commands
wk.add({
	{ "<leader>j", group = "Jump/flash in code" },
	{
		"<leader>jj",
		function()
			require("flash").jump()
		end,
		desc = "Flash jump",
	},
	{
		"<leader>jt",
		function()
			require("flash").treesitter()
		end,
		desc = "Treesitter jump",
	},
	{
		"<leader>js",
		function()
			require("flash").treesitter_search()
		end,
		desc = "Treesitter search",
	},
})

-- Fold shortcut to open or fold functions etc
vim.keymap.set("n", "<C-f>", "za") -- Fold or unfold
