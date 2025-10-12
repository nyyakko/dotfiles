local ufo = require('ufo')

ufo.setup()

vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

local map = vim.keymap.set

map({ 'n' }, 'zR', ufo.openAllFolds)
map({ 'n' }, 'zM', ufo.closeAllFolds)
map({ 'n' }, 'zr', ufo.openFoldsExceptKinds)
map({ 'n' }, 'zm', ufo.closeFoldsWith)
map({ 'n' }, 'zP', ufo.peekFoldedLinesUnderCursor)

