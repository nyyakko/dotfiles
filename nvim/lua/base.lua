local keymap = vim.keymap.set
local opts = { silent = true }

keymap('', '<Space>', '<Nop>', opts)

vim.g.mapleader = ' '

keymap('n', '<C-t>l', ':tabnext<CR>', opts)
keymap('n', '<C-t>h', ':tabprev<CR>', opts)
keymap('n', '<C-t>m', ':tabnew<CR>', opts)
keymap('n', '<leader>ss', ':split<CR><BAR><C-w>j<CR>', opts)
keymap('n', '<leader>sv', ':vsplit<CR><BAR><C-w>l<CR>', opts)
keymap('n', '<leader>sq', ':q<CR>', opts)
