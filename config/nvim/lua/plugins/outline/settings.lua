local outline = require('outline')

outline.setup({})

local map = vim.keymap.set
local opts = { silent=true }

map({ 'n' }, '<leader>O', ':Outline<CR>', opts)
