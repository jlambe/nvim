return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                theme = 'catppuccin'
            },
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
    },
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
            'MunifTanjim/nui.nvim',
            -- '3rd/image.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        opts = {
            buffers = {
                follow_current_file = {
                    enabled = true,
                }
            }
        },
        keys = {
            { '<C-p>', '<cmd>Neotree reveal<cr>', desc = 'Open Neotree.' },
        }
    }
}
