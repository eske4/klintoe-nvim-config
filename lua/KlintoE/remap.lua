-- Set leader to space
vim.g.mapleader = " "

-- Define key mappings
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Calling git status" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move highlighted items down in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Move highlighted items up in visual mode

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Copy to clipboard outside of nvim" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy to clipboard outside of nvim" })

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete to void register" })

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>ts", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Switch tmux session" })

-- Ensure ctrl+s works in every mode without leaving insert mode when in insert mode
vim.keymap.set("n", "<c-s>", ":w<cr>")
vim.keymap.set("v", "<c-s>", ":w<cr>")
vim.keymap.set("i", "<c-s>", "<Esc>:w<cr>a")

vim.keymap.set('n', '<C-f>', 'za') -- Fold or unfold

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dp", { desc = "Paste and remove marked word into void" })

vim.api.nvim_set_keymap('n', '<leader>nth', ':split<cr>', { desc = "Create a new tab horizontally" }) -- New tab horizontal
vim.api.nvim_set_keymap('n', '<leader>ntv', ':vsplit<cr>', { desc = "Create a new tab vertically" }) -- New tab vertical

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace every word, only in current document" })
