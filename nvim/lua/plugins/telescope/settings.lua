local telescope = require('telescope')

telescope.setup({
    defaults = {
        mappings = {
            i = { ['<esc>'] = require('telescope.actions').close }
        }
    }
})

telescope.load_extension('file_browser')

local opts = { silent = true, noremap = true }
local keymap = vim.keymap.set

keymap('n', '<leader>fb', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', opts)
keymap('n', '<leader>ff', ':Telescope find_files<CR>', opts)
keymap('n', '<leader>fh', ':Telescope oldfiles<CR>', opts)
keymap('n', '<leader>fk', ':Telescope buffers<CR>', opts)
keymap('n', '<leader>fg', ':lua require(\'telescope.builtin\').live_grep({search_dirs={vim.fn.expand(\'%:p\')}})<CR>', opts)
keymap('n', '<leader>fG', ':Telescope live_grep<CR>', opts)
keymap('n', '<leader>ft', ':lua require(\'telescope-tabs\').list_tabs()<CR>', opts)

