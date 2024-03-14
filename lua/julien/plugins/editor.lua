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
        keys = {
            { '<leader>gf', '<cmd>Git<cr>', desc = 'Open Git status.' },
        },
    },
    {
        'danymat/neogen',
        opts = {
            snippet_engine = 'luasnip',
        },
        keys = {
            { '<leader>nn', function() require('neogen').generate({}) end, desc = 'Neogen generate annotation.' },
        },
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
    },
    {
        'numToStr/Comment.nvim',
        lazy = false,
        config = function()
            require('Comment').setup()
        end
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        config = function()
            local hooks = require('ibl.hooks')
            local palette = require('catppuccin.palettes').get_palette()

            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, 'IblIndent', { fg = palette.crust })
                vim.api.nvim_set_hl(0, 'IblScope', { fg = palette.peach })
            end)

            require('ibl').setup({
                enabled = true,
                indent = {
                    char = '▏',
                    highlight = 'IblIndent',
                },
                scope = {
                    highlight = 'IblScope'
                },
            })
        end
    },
    {
        'folke/flash.nvim',
        event = 'VeryLazy',
        opts = {
            search = {
                multi_window = false,
                forward = true,
                wrap = true,
            },
        },
    },
    {
        'hedyhli/outline.nvim',
        opts = {},
        keys = {
            { '<leader>ou', '<cmd>Outline<cr>', desc = 'Toggle Outline.' },
        }
    },
    {
        'Exafunction/codeium.vim',
        event = 'BufEnter',
        cmd = 'Codeium',
        build = ':Codeium Auth',
        keys = {
            { '<C-x>', function () return vim.fn['codeium#Clear']() end, mode = { 'i' }, desc = 'Codeium clear' },
        },
    },
}
