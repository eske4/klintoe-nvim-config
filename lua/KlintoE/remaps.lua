-- Set leader key
vim.g.mapleader = " "

-----------------------------------------------------------
-- Settings to improve Nvim but not shortcuts to remember--
-----------------------------------------------------------

-- Enables movement of highlighted text and movement inside code blocks etc
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move highlighted items down in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Move highlighted items up in visual mode

-- Fold shortcut to open or fold functions etc
vim.keymap.set("n", "<C-f>", "za") -- Fold or unfold

-- Reduce jumping when searching or move item 1 line up
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
