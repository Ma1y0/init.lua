vim.g.mapleader = " "

-- Clears search on Esc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Splits navigation
vim.keymap.set("n", "<c-j>", "<c-w><c-j>")
vim.keymap.set("n", "<c-k>", "<c-w><c-k>")
vim.keymap.set("n", "<c-l>", "<c-w><c-l>")
vim.keymap.set("n", "<c-h>", "<c-w><c-h>")
