-- You dont need to set any of these options. These are the default ones.
require('telescope').setup {
    defaults = {
    },
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = 'smart_case',       -- or "ignore_case" or "respect_case", the default case_mode is "smart_case"
        },
        file_browser = {
            hijack_netrw = false
        },
    }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
vim.keymap.set('n', '<leader>sg', function()
    builtin.grep_string({ search = vim.fn.input('Grep > '), no_ignore = true })
end)
vim.keymap.set('n', '<leader>so', function()
    builtin.find_files({
        no_ignore = true
    })
end, {});
--vim.keymap.set('n', '<leader>sm', builtin.treesitter, {});
vim.keymap.set('n', '<leader>fb', function()
    local telescope = require('telescope')

    local function telescope_buffer_dir()
        return vim.fn.expand('%:p:h')
    end

    telescope.extensions.file_browser.file_browser({
        path = '%:p:h',
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
    })
end, {})
