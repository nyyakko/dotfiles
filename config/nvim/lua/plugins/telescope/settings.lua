local telescope = require('telescope')

telescope.setup({
    defaults = {
        mappings = {
            i = { ['<esc>'] = require('telescope.actions').close }
        }
    },
})

telescope.load_extension('live_grep_args')
telescope.load_extension('file_browser')
telescope.load_extension('ui-select')

local opts = { silent = true, noremap = true }
local map = vim.keymap.set

map({ 'n' }, '<leader>fb', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', opts)
map({ 'n' }, '<leader>ff', ':Telescope find_files<CR>', opts)
map({ 'n' }, '<leader>fh', ':Telescope oldfiles<CR>', opts)
map({ 'n' }, '<leader>fk', ':Telescope buffers<CR>', opts)
map({ 'n' }, '<leader>ps', ':SessionManager load_session<CR>', opts)
map({ 'n' }, '<leader>fg', ':lua require(\'telescope\').extensions.live_grep_args.live_grep_args({search_dirs={vim.fn.expand(\'%:p\')}})<CR>', opts)
map({ 'n' }, '<leader>fG', ':lua require(\'telescope\').extensions.live_grep_args.live_grep_args()<CR>', opts)
map({ 'n' }, '<leader>km', ':Telescope keymaps<CR>', opts)
map({ 'n' }, '<leader>ft', ':lua require(\'telescope-tabs\').list_tabs()<CR>', opts)

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'TelescopePrompt' },
    callback = function(ctx)
        local backdropName = 'FloatBackdrop'
        local buffer = ctx.buf
        local zindex = 50
        local backdropBuffer = vim.api.nvim_create_buf(false, true)
        local winnr = vim.api.nvim_open_win(backdropBuffer, false, {
            relative = 'editor',
            border = 'none',
            row = 0,
            col = 0,
            width = vim.o.columns,
            height = vim.o.lines,
            focusable = false,
            style = 'minimal',
            zindex = zindex - 1,
        })

        vim.api.nvim_set_hl(0, backdropName, { bg = '#000000', default = true })
        vim.wo[winnr].winhighlight = 'Normal:' .. backdropName
        vim.wo[winnr].winblend = 50
        vim.bo[backdropBuffer].buftype = 'nofile'

        vim.api.nvim_create_autocmd({ 'WinClosed', 'BufLeave' }, {
            once = true,
            buffer = buffer,
            callback = function()
                if vim.api.nvim_win_is_valid(winnr) then
                    vim.api.nvim_win_close(winnr, true)
                end
                if vim.api.nvim_buf_is_valid(backdropBuffer) then
                    vim.api.nvim_buf_delete(backdropBuffer, { force = true })
                end
            end,
        })
    end,
})
