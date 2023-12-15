local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})

    -- Rename
    vim.keymap.set('n', '<F6>', function ()
        vim.lsp.buf.rename()
    end, { buffer = bufnr })
    -- Code action
    vim.keymap.set('n', '<C-x>', function ()
        vim.lsp.buf.code_action()
    end, { buffer = bufnr })
    -- Format
    vim.keymap.set('n', '<F7>', function ()
        vim.lsp.buf.format()
    end, { buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    -- Define list of LSP servers to install
    ensure_installed = { 'ansiblels', 'clangd', 'cssls', 'html', 'jsonls', 'lua_ls', 'phpactor', 'rust_analyzer', 'tsserver', 'yamlls' },
    handlers = {
        lsp_zero.default_setup,
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
