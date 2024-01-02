return {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
        style = 'day',
        terminal_colors = true,
        lualine_bold = true,
    },
    config = function()
        vim.cmd.colorscheme('tokyonight-day')
    end
}
