-- Terminal Configuration
vim.api.nvim_create_autocmd('TermOpen', {
    desc = 'Terminal Configuration',
    group = vim.api.nvim_create_augroup('terminal-configuration', { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})

vim.keymap.set("n", "<leader>tt", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 15)
end);
