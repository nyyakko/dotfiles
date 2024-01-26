local keymap = vim.keymap.set
local opts   = { silent = true }

keymap("", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "
vim.g.neovide_scroll_animation_length = 0

keymap('n', '<leader>ss', ':split<CR><BAR><C-w>j<CR>', opts)
keymap('n', '<leader>sv', ':vsplit<CR><BAR><C-w>l<CR>', opts)
keymap('n', '<leader>sq', ':q<CR>', opts)

require('barbecue').setup({})
