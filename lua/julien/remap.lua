-- Remap leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<C-p>', vim.cmd.Ex)

-- Navigate
vim.keymap.set('n', '<C-d>', '<C-d>zz');
vim.keymap.set('n', '<C-u>', '<C-u>zz');
vim.keymap.set('n', 'n', 'nzzzv');
vim.keymap.set('n', 'N', 'Nzzzv');

-- Move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

