local dashboard = require('alpha.themes.dashboard')

dashboard.section.header.val = {

[[ ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓  ]],
[[  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ]],
[[ ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ]],
[[ ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ]],
[[ ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ]],
[[ ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ]],
[[ ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ]],
[[    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ]],
[[          ░    ░  ░    ░ ░        ░   ░         ░    ]],
[[                                 ░                   ]]

}

dashboard.section.buttons.val = {
    dashboard.button("e", "󰈔  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "󰱼  Find file", ":Telescope find_files <CR>"),
    dashboard.button("t", "󰈬  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("r", "󱋡  Recently used files", ":Telescope oldfiles <CR>"),
    dashboard.button("q", "󰩈  Quit Neovim", ":qa<CR>"),
}

local function footer()
    return "Ergo ad sepulchrum itero quia in tenebrae sum."
end

dashboard.section.footer.val = footer()

require('alpha').setup(dashboard.config)
