require('themery').setup({
    themeConfigFile = "~/.config/nvim/lua/themes/themes.lua",
    themes = {
        {
            name = "Midnight",
            colorscheme = "midnight",
            before = [[
                vim.opt.background = "dark"
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
            name = "VSCode (Dark)",
            colorscheme = "vscode",
            before = [[
                vim.opt.background = "dark"
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
            name = "Onedark (Light)",
            colorscheme = "onelight",
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
            name = "VSCode (Light)",
            colorscheme = "vscode",
            before = [[
                vim.opt.background = "light"
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

-- Themery block
-- This block will be replaced by Themery.
require('onedark').setup({
style = 'darker'
})
require('onedark').load()


vim.cmd("colorscheme onedark")
vim.g.theme_id = 3
-- end themery block
