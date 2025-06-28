local tiny_code_action = require('tiny-code-action')

local map = vim.keymap.set

map({ 'n', 'v' }, '<leader>ca', function() tiny_code_action.code_action() end, { silent=true })
