return {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    opts = {
        flavour = 'latte',
        integrations = {
            cmp = true,
            gitsigns = true,
            mason = true,
            native_lsp = {
                enabled = true,
            },
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
