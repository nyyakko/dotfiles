local dashboard = require('alpha.themes.dashboard')

dashboard.section.header.val = {

[[]],
[[]],
[[]],
[[]],
[[]],
[[]],

[[ nvim. ]],

[[]],
[[]],
[[]],
[[]],
[[]],
[[]],

}

dashboard.section.buttons.val = {
    dashboard.button('e', '󰈔  New file', ':ene <BAR> startinsert <CR>'),
    dashboard.button('f', '󰱼  Find file', ':Telescope find_files <CR>'),
    dashboard.button('t', '󰈬  Find text', ':Telescope live_grep <CR>'),
    dashboard.button('r', '󱋡  Recently used files', ':Telescope oldfiles <CR>'),
    dashboard.button('q', '󰩈  Quit', ':qa<CR>'),
}

require('alpha').setup(dashboard.config)
