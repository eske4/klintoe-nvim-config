vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Calling git status" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- to move highlighted items down in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- to move highlighted items up in visual mode

vim.keymap.set("n", "<leader>y", "\"+y", { desc = "Copy to clipboard outside of nvim" }) -- to copy to system clipboard, so i can copy thing to be used outside nvim
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Copy to clipboard outside of nvim" }) -- to copy to system clipboard, so i can copy thing to be used outside nvim
vim.keymap.set("n", "<leader>y", "\"+Y", { desc = "Copy to clipboard outside of nvim" }) -- to copy to system clipboard, so i can copy thing to be used outside nvim

-- ensures the ctrl s works in every mode while not leaving insert mode when in insert mode
vim.api.nvim_set_keymap("n", "<c-s>", ":update<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<c-s>", ":update<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<c-s>", "<Esc>:update<cr>a", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-f>', 'za', { noremap = true, silent = true }) -- fold or unfold

vim.api.nvim_set_keymap('n', '<leader>nth', ':split<cr>', { noremap = true, silent = true }) -- new tab horizontal
vim.api.nvim_set_keymap('n', '<leader>ntv', ':vsplit<cr>', { noremap = true, silent = true }) -- new tab vertical
