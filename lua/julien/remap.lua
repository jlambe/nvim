-- Remap leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Open Netrw
-- vim.keymap.set('n', '<C-p>', vim.cmd.Ex)

-- Navigate
vim.keymap.set('n', '<C-d>', '<C-d>zz');
vim.keymap.set('n', '<C-u>', '<C-u>zz');
vim.keymap.set('n', 'n', 'nzzzv');
vim.keymap.set('n', 'N', 'Nzzzv');

-- Move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Quickfix
vim.keymap.set('n', '<leader>cn', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<leader>cp', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>cc', '<cmd>cclose<CR>')

-- Terminal
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')

-- Tmux Sessionizer
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')
