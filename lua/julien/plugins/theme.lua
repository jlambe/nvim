return {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    opts = {
        flavour = 'latte',
        transparent_background = true,
        integrations = {
            cmp = true,
            gitsigns = true,
            mason = true,
            native_lsp = {
                enabled = true,
            },
            neotree = true,
            notify = true,
            treesitter = true,
            telescope = {
                enabled = true,
            },
        }
    },
    config = function()
        vim.cmd.colorscheme('catppuccin-latte')

        -- Make background transparent
        vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    end
}
