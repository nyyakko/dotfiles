local nabla = require('nabla')

local map = vim.keymap.set
local opts = { silent=true }

map({ 'n' }, '<leader>ml', function() nabla.popup({ border='rounded' }) end, opts)
