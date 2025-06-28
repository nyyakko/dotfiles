require('themery').setup({
    themes = {
        {
            name = "Artic",
            colorscheme = "arctic",
            before = [[
            ]],
            after = [[
            ]]
        },
        {
            name = "Kanagawa Wave",
            colorscheme = "kanagawa-wave",
            before = [[
                vim.opt.background = "dark"
            ]],
            after = [[
            ]]
        },
        {
            name = "Kanagawa Dragon",
            colorscheme = "kanagawa-dragon",
            before = [[
                vim.opt.background = "dark"
            ]],
            after = [[
            ]]
        },
        {
            name = "Midnight",
            colorscheme = "midnight",
            before = [[
                vim.opt.background = "dark"
            ]],
            after = [[
                vim.cmd("highlight FoldColumn guifg=#b9b9b9 guibg=Normal")
                vim.cmd("highlight Folded guibg=Normal")
            ]]
        },
        {
            name = "Gruber Darker",
            colorscheme = "gruber-darker",
            before = [[
                vim.cmd("highlight Folded guibg=Normal")
            ]],
            after = [[
                vim.cmd("highlight FoldColumn guifg=#cc8c3c guibg=Normal")
                vim.cmd("highlight Folded guibg=Normal")
            ]]
        },
        {
            name = "Onedark",
            colorscheme = "onedark",
            before = [[
                require('onedark').setup({
                    style = 'dark'
                })
                require('onedark').load()
            ]],
            after = [[
                vim.cmd("highlight Folded guibg=Normal")
            ]]
        },
        {
            name = "Onedark (Darker)",
            colorscheme = "onedark",
            before = [[
                require('onedark').setup({
                    style = 'darker'
                })
                require('onedark').load()
            ]],
            after = [[
                vim.cmd("highlight Folded guibg=Normal")
            ]]
        },
        {
            name = "Ayu (Dark)",
            colorscheme = "ayu",
            before = [[
                vim.opt.background = "dark"
            ]],
            after = [[
                vim.cmd("highlight Folded guibg=Normal")
            ]]
        },
        {
            name = "Gruvbox (Dark)",
            colorscheme = "gruvbox",
            before = [[
                vim.opt.background = "dark"
            ]],
            after = [[
                vim.cmd("highlight Folded guibg=Normal")
            ]]
        },
        {
            name = "VSCode Dark Plus (Dark)",
            colorscheme = "vscode",
            before = [[
                vim.opt.background = "dark"
            ]],
            after = [[
                vim.cmd("highlight Folded guibg=Normal")
            ]]
        },
        {
            name = "e-ink (Dark)",
            colorscheme = "e-ink",
            before = [[
                vim.opt.background = "dark"
            ]],
            after = [[
                vim.cmd("highlight Folded guibg=Normal")
            ]]
        },
        {
            name = "Kanagawa Lotus",
            colorscheme = "kanagawa-lotus",
            after = [[
            ]]
        },
        {
            name = "e-ink (Light)",
            colorscheme = "e-ink",
            before = [[
                vim.opt.background = "light"
            ]],
            after = [[
                vim.cmd("highlight Folded guibg=Normal")
            ]]
        },
        {
            name = "VSCode Dark Plus (Light)",
            colorscheme = "vscode",
            before = [[
                vim.opt.background = "light"
            ]],
            after = [[
                vim.cmd("highlight Folded guibg=Normal")
            ]]
        },
        {
            name = "Ayu (Light)",
            colorscheme = "ayu",
            before = [[
                vim.opt.background = "light"
            ]],
            after = [[
                vim.cmd("highlight Folded guibg=Normal")
            ]]
        },
        {
            name = "Gruvbox (Light)",
            colorscheme = "gruvbox",
            before = [[
                vim.opt.background = "light"
            ]],
            after = [[
                vim.cmd("highlight Folded guibg=Normal")
            ]]
        }
    }
})
