return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                theme = 'catppuccin'
            }
        }
    },
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            current_line_blame_opts = {
                delay = 150
            }
        }
    },
    {
        'folke/zen-mode.nvim',
        opts = {
            window = {
                backdrop = 1,
                width = 180,
                options = {
                    cursorline = true,
                }
            },
            plugins = {
                gitsigns = { enabled = true },
                tmux = { enabled = true }
            }
        }
    },
    {
        'tpope/vim-fugitive',
    },
    {
        'rcarriga/nvim-notify',
        config = function()
            require('notify').setup({
                background_colour = '#ffffff'
            })

            vim.notify = require('notify')
        end
    }
}
