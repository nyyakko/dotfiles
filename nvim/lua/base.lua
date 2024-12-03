local map = vim.keymap.set
local opts = { silent = true }

map('', '<Space>', '<Nop>', opts)

vim.g.mapleader = ' '

map('n', '<C-t>l', ':tabnext<CR>', opts)
map('n', '<C-t>h', ':tabprev<CR>', opts)
map('n', '<C-t>m', ':tabnew<CR>', opts)
map('n', '<leader>ss', ':split<CR><BAR><C-w>j<CR>', opts)
map('n', '<leader>sv', ':vsplit<CR><BAR><C-w>l<CR>', opts)
map('n', '<leader>sq', ':q<CR>', opts)
