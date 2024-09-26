local set = vim.keymap.set

-- Remap leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Open Netrw
-- vim.keymap.set("n", "<C-p>", vim.cmd.Ex)

-- Navigate
set("n", "<C-d>", "<C-d>zz");
set("n", "<C-u>", "<C-u>zz");
set("n", "n", "nzzzv");
set("n", "N", "Nzzzv");

-- Move lines in visual mode
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- Quickfix
set("n", "<leader>cn", "<cmd>cnext<CR>zz")
set("n", "<leader>cp", "<cmd>cprev<CR>zz")
set("n", "<leader>cc", "<cmd>cclose<CR>")

-- Copy current file path to clipboard
set("n", "<leader>fp", function ()
    local filepath = vim.fn.expand("%")
    vim.fn.setreg("+", filepath)
end)

-- Terminal
set("t", "<ESC>", "<C-\\><C-n>")

-- Tmux Sessionizer
set("n", "<C-f>", "<cmd>silent !tmux display-popup -E tmux-sessionizer<CR>")

-- Lua Reload
set("n", "<leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

