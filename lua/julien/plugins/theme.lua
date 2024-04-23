return {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    opts = {
        flavour = 'latte',
        transparent_background = false,
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
    end
}
