local alpha = require('alpha')

local dashboard = require('alpha.themes.dashboard')

dashboard.section.header.val = {

[[]],
[[]],
[[]],
[[]],
[[]],
[[]],

[[ nvim ]],

[[]],
[[]],
[[]],
[[]],
[[]],
[[]],

}

dashboard.section.buttons.val = {
    dashboard.button('e', '󰈔  New File', ':ene <BAR> startinsert<CR>'),
    dashboard.button('f', '󰱼  Find File', ':Telescope find_files<CR>'),
    dashboard.button('t', '󰈬  Find Text', ':Telescope live_grep<CR>'),
    dashboard.button('s', '󰥔  Recent Sessions', ':SessionManager load_session<CR>'),
    dashboard.button('r', '󱋡  Recent Files', ':Telescope oldfiles<CR>'),
    dashboard.button('q', '󰩈  Quit', ':qa<CR>'),
}

alpha.setup(dashboard.config)
