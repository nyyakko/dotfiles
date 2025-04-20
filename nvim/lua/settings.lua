local map = vim.keymap.set

map('', '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '

map('n', '<C-t>l', ':tabnext<CR>', { silent = true })
map('n', '<C-t>h', ':tabprev<CR>', { silent = true })
map('n', '<C-t>m', ':tabnew<CR>', { silent = true })
map('n', '<leader>ss', ':split<CR><BAR><C-w>j<CR>', { silent = true })
map('n', '<leader>sv', ':vsplit<CR><BAR><C-w>l<CR>', { silent = true })
map('n', '<leader>sq', ':q<CR>', { silent = true })
