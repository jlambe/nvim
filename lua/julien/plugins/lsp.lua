return {
    -- LSP
    -- https://github.com/VonHeikemen/lsp-zero.nvim
    {
        'williamboman/mason.nvim',
        opts = {},
    },
    {
        'williamboman/mason-lspconfig.nvim',
        opts = function()
            local lsp_zero = require('lsp-zero')

            return {
                -- Define list of LSP servers to install
                ensure_installed = { 'ansiblels', 'clangd', 'cssls', 'eslint', 'html', 'intelephense', 'jsonls', 'lua_ls', 'rust_analyzer', 'tsserver', 'yamlls' },
                handlers = {
                    lsp_zero.default_setup,
                },
            }
        end,
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            ---@diagnostic disable-next-line: unused-local
            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })

                -- Rename
                vim.keymap.set('n', '<F6>', function()
                    vim.lsp.buf.rename()
                end, { buffer = bufnr })
                -- Code action
                vim.keymap.set('n', '<C-x>', function()
                    vim.lsp.buf.code_action()
                end, { buffer = bufnr })
                -- Format
                vim.keymap.set('n', '<F7>', function()
                    vim.lsp.buf.format()
                end, { buffer = bufnr })
            end)

            lsp_zero.set_sign_icons = false
        end,
    },
    {
        'neovim/nvim-lspconfig'
    },
    {
        'hrsh7th/cmp-nvim-lsp'
    },
    {
        'hrsh7th/nvim-cmp',
        opts = function()
            local cmp = require('cmp')

            return {
                mapping = cmp.mapping.preset.insert({
                    -- 'Enter' key to confirm completion
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                })
            }
        end
    },
    {
        'L3MON4D3/LuaSnip'
    },
}
