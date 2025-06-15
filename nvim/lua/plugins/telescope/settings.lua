local telescope = require('telescope')

telescope.setup({
    defaults = {
        mappings = {
            i = { ['<esc>'] = require('telescope.actions').close }
        }
    }
})

telescope.load_extension('live_grep_args')
telescope.load_extension('file_browser')

local opts = { silent = true, noremap = true }
local map = vim.keymap.set

map({ 'n' }, '<leader>fb', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', opts)
map({ 'n' }, '<leader>ff', ':Telescope find_files<CR>', opts)
map({ 'n' }, '<leader>fh', ':Telescope oldfiles<CR>', opts)
map({ 'n' }, '<leader>fk', ':Telescope buffers<CR>', opts)
map({ 'n' }, '<leader>fg', ':lua require(\'telescope\').extensions.live_grep_args.live_grep_args({search_dirs={vim.fn.expand(\'%:p\')}})<CR>', opts)
map({ 'n' }, '<leader>fG', ':lua require(\'telescope\').extensions.live_grep_args.live_grep_args()<CR>', opts)
map({ 'n' }, '<leader>km', ':Telescope keymaps<CR>', opts)
map({ 'n' }, '<leader>ft', ':lua require(\'telescope-tabs\').list_tabs()<CR>', opts)

