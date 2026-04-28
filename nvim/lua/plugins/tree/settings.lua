local tree = require('neo-tree')

tree.setup({})

local map = vim.keymap.set

map({ 'n' }, '<leader><enter>', ':Neotree toggle<CR>', { silent=true })
