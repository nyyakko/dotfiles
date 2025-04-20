require('themery').setup({
    themes = {
        {
            name = "Midnight",
            colorscheme = "midnight",
            before = [[
                vim.opt.background = "dark"
            ]],
            after = [[
                vim.cmd("highlight FoldColumn guifg=#b9b9b9 guibg=#080c10")
            ]]
        },
        {
            name = "Gruber Darker",
            colorscheme = "gruber-darker",
            before = [[
            ]],
            after = [[
                vim.cmd("highlight FoldColumn guifg=#cc8c3c guibg=#181818")
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
            ]]
        },
        {
            name = "Ayu (Dark)",
            colorscheme = "ayu",
            before = [[
                vim.opt.background = "dark"
            ]]
        },
        {
            name = "Cyberdream (Dark)",
            colorscheme = "cyberdream",
            before = [[
                require('cyberdream').setup({
                    borderless_telescope = false,
                    theme = {
                        variant = 'dark'
                    }
                })
            ]]
        },
        {
            name = "Gruvbox (Dark)",
            colorscheme = "gruvbox",
            before = [[
                vim.opt.background = "dark"
            ]]
        },
        {
            name = "VSCode Dark Plus (Dark)",
            colorscheme = "vscode",
            before = [[
                vim.opt.background = "dark"
            ]]
        },
        {
            name = "e-ink (Dark)",
            colorscheme = "e-ink",
            before = [[
                vim.opt.background = "dark"
            ]]
        },
        {
            name = "e-ink (Light)",
            colorscheme = "e-ink",
            before = [[
                vim.opt.background = "light"
            ]]
        },
        {
            name = "VSCode Dark Plus (Light)",
            colorscheme = "vscode",
            before = [[
                vim.opt.background = "light"
            ]]
        },
        {
            name = "Ayu (Light)",
            colorscheme = "ayu",
            before = [[
                vim.opt.background = "light"
            ]]
        },
        {
            name = "Cyberdream (Light)",
            colorscheme = "cyberdream",
            before = [[
                require('cyberdream').setup({
                    borderless_telescope = false,
                    theme = {
                        variant = 'light'
                    }
                })
            ]]
        },
        {
            name = "Gruvbox (Light)",
            colorscheme = "gruvbox",
            before = [[
                vim.opt.background = "light"
            ]]
        }
    }
})
