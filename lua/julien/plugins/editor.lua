return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                theme = 'tokyonight'
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
        'akinsho/bufferline.nvim',
        version = '*',
        event = 'VeryLazy',
        dependencies = 'nvim-tree/nvim-web-devicons',
        opts = {
            options = {
                mode = 'buffers',
                themable = true,
                indicator = {
                    style = 'none',
                },
                color_icons = false,
                show_buffer_icons = false,
                separator_style = { '', '' },
            },
        },
        keys = {
            { '<TAB>', function() require('bufferline').cycle(1) end, desc = 'Go to bufferline next tab.' },
            { '<S-TAB>', function() require('bufferline').cycle(-1) end, desc = 'Go to bufferline previous tab.' },
            { '<leader-cl>', function() require('bufferline').close_others() end, desc = 'Close bufferline others tabs.' },
        },
        config = function(_, opts)
            require("bufferline").setup(opts)
            -- Fix bufferline when restoring a session
            vim.api.nvim_create_autocmd("BufAdd", {
                callback = function()
                    vim.schedule(function()
                        pcall(nvim_bufferline)
                    end)
                end,
            })
        end,
    },
}

