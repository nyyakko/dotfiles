local tree = require('nvim-tree')
local keymap = vim.keymap.set

tree.setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

keymap('n', '<leader>o', function ()
    if require('nvim-tree.view').is_visible() then
        require('nvim-tree.view').close()
    else
        require('nvim-tree.lib').open()
    end
end, { silent = true })
