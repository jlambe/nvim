return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                theme = 'catppuccin'
            },
            sections = {
                lualine_x = {
                    'codeium#GetStatusString',
                    'encoding',
                    'fileformat',
                    'filetype',
                }
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
            { '<leader>bl', '<cmd>Git blame<cr>', desc = 'Git blame.' },
        },
    },
    {
        'christoomey/vim-tmux-navigator',
        keys = {
            { '<C-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
            { '<C-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
            { '<C-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
            { '<C-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
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
        'nvim-tree/nvim-tree.lua',
        lazy = false,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        opts = {
            view = {
                centralize_selection = true,
            },
            hijack_directories = {
                auto_open = false,
            },
        },
        keys = {
            { '<C-p>', function() require('nvim-tree.api').tree.toggle({ find_file = true }) end, desc = 'Toggle NvimTree.' },
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
        -- @TOTO: look at tpope/vim-dispatch as alternative...
        'vim-test/vim-test',
        keys = {
            { '<leader>t', '<cmd>TestNearest<cr>', desc = 'Run nearest test from cursor.' },
            { '<leader>l', '<cmd>TestLast<cr>', desc = 'Run last test.' },
        },
    },
    {
        'Exafunction/codeium.vim',
        event = 'BufEnter',
        cmd = 'Codeium',
        build = ':Codeium Auth',
        keys = {
            { '<C-x>',  function() return vim.fn['codeium#Clear']() end,              mode = { 'i' }, desc = 'Codeium clear' },
            { '<C-s>l', function() return vim.fn['codeium#CycleCompletions'](1) end,  mode = { 'i' }, desc = 'Codeium next suggestion' },
            { '<C-s>h', function() return vim.fn['codeium#CycleCompletions'](-1) end, mode = { 'i' }, desc = 'Codeium previous suggestion' },
            { '<Tab>',  function() return vim.fn['codeium#Accept']() end,             mode = { 'i' }, desc = 'Codeium accept' },
        },
    },
}
