local tree = require('nvim-tree')

tree.setup({})

local map = vim.keymap.set

map({ 'n' }, '<leader><enter>', ':NvimTreeToggle<CR>', { silent=true })
