-- Set leader to space
vim.g.mapleader = " "

-- Define key mappings
vim.keymap.set("n", "<leader>sd", ":Oil<cr>", { desc = "Browse directory" })
vim.keymap.set("n", "<leader>st", ":TodoTelescope<cr>", { desc = "Search TodoList" })
vim.keymap.set("n", "<leader>gb", ":Neogit<cr>", { desc = "Trigger Neogit" })
vim.keymap.set("n", "<leader>gh", ":DiffviewFileHistory<cr>", { desc = "Look at git file history" })

vim.keymap.set("n", "<leader>gss", ":lua require('gitsigns').stage_hunk()<cr>", { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>gsu", ":lua require('gitsigns').undo_stage_hunk()<cr>", { desc = "Undo stage hunk" })
vim.keymap.set("n", "<leader>gsr", ":lua require('gitsigns').reset_hunk()<cr>", { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>gsp", ":lua require('gitsigns').preview_hunk()<cr>", { desc = "Preview hunk" })
vim.keymap.set(
	"n",
	"<leader>gsb",
	":lua require('gitsigns').blame_line()<cr>",
	{ desc = "Blame line, who did write it or change it" }
)
vim.keymap.set("n", "<leader>gsf", ":lua require('gitsigns').diffthis('~1')<cr>", { desc = "Diff this" })
vim.keymap.set("n", "<leader>gsn", ":lua require('gitsigns').next_hunk()<cr>", { desc = "Next hunk" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move highlighted items down in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Move highlighted items up in visual mode

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to clipboard outside of nvim" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy to clipboard outside of nvim" })

vim.keymap.set({ "n", "v" }, "<leader>dv", [["_d]], { desc = "Delete to void register" })

vim.keymap.set("n", "Q", "<nop>")

-- Ensure ctrl+s works in every mode without leaving insert mode when in insert mode
vim.keymap.set("n", "<c-s>", ":w<cr>")
vim.keymap.set("v", "<c-s>", ":w<cr>")
vim.keymap.set("i", "<c-s>", "<Esc>:w<cr>a")

vim.keymap.set("n", "<C-f>", "za") -- Fold or unfold

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", '"_dp', { desc = "Paste and remove marked word into void" })

vim.api.nvim_set_keymap("n", "<leader>nth", ":split<cr>", { desc = "Create a new tab horizontally" }) -- New tab horizontal
vim.api.nvim_set_keymap("n", "<leader>ntv", ":vsplit<cr>", { desc = "Create a new tab vertically" }) -- New tab vertical

vim.keymap.set(
	"n",
	"<leader>rw",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace every word, only in current document" }
)

vim.keymap.set("n", "<C-7>", '<cmd>exe v:count1 . "ToggleTerm"<CR>')
vim.keymap.set("i", "<C-7>", '<cmd>exe v:count1 . "ToggleTerm"<CR>')

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
