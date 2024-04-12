local winshift = require('winshift')

winshift.setup({
    highlight_moving_win = true,
    focused_hl_group = 'Visual',
    moving_win_options = {
        wrap = false,
        cursorline = false,
        cursorcolumn = false,
        colorcolumn = '',
    },
    keymaps = {
        disable_defaults = true
    },

    window_picker = function()
        return require('winshift.lib').pick_window({
            picker_chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
            filter_rules = {
                cur_win = true,
                floats = true,
                filetype = {},
                buftype = {},
                bufname = {},
            },
            filter_func = nil,
        })
    end,
})

local keymap = vim.keymap.set
local opts = { silent = true }

keymap('n', '<C-W>S', ':WinShift swap<CR>', opts)

keymap('n', '<C-M>H', ':WinShift left<CR>', opts)
keymap('n', '<C-M>J', ':WinShift down<CR>', opts)
keymap('n', '<C-M>K', ':WinShift up<CR>', opts)
keymap('n', '<C-M>L', ':WinShift right<CR>', opts)
