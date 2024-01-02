return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
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
        },
        config = function()
            require('telescope').load_extension('fzf')
            require('telescope').load_extension('file_browser')
        end,
        keys = {
            { '<leader>sf', function() require('telescope.builtin').find_files() end, desc = 'Open telescope files fuzzy finder.' },
            { '<leader>sb', function() require('telescope.builtin').buffers() end, desc = 'Open telescope buffers fuzzy finder.' },
            { '<leader>sg', function() require('telescope.builtin').grep_string({ search = vim.fn.input('Grep > '), no_ignore = true }) end, desc = 'Open telescope grep search.' },
            { '<leader>so', function() require('telescope.builtin').find_files({ no_ignore = true }) end, desc = 'Open telescope files fuzzy finder including all igored files.' },
            { '<leader>fb', function()
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
            end, desc = 'Open telescope file browser.' }
        }
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    {
        'nvim-telescope/telescope-file-browser.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/plenary.nvim'
        }
    },
}

