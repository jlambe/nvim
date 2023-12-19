-- Bufferline mapping
local bufferline = require('bufferline')

bufferline.setup({
    options = {
        mode = 'tabs',
    },
    highlights = require('catppuccin.groups.integrations.bufferline').get(),
})

-- Navigate to next buffer tab
vim.keymap.set('n', '<TAB>', function()
    bufferline.cycle(1)
end, {})

-- Navigate to previous buffer tab
vim.keymap.set('n', '<S-tab>', function()
    bufferline.cycle(-1)
end, {})

-- Close others tabs
vim.keymap.set('n', '<leader>cl', function()
    bufferline.close_others()
end, {})
