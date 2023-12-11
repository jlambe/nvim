local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    -- Define list of LSP servers to install
    ensure_installed = { 'ansiblels', 'clangd', 'cssls', 'html', 'jsonls', 'lua_ls', 'phpactor', 'rust_analyzer', 'tsserver', 'yamlls' },
    handlers = {
        lsp_zero.default_setup,
        phpactor = function ()
            require('lspconfig').phpactor.setup({
                ["indexer.exclude_patterns"] = "",
            })
        end
    },
})

lsp_zero.set_sign_icons = false

-- Custom key binding for autocompletion
local cmp = require('cmp')

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- 'Enter' key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    })
})
