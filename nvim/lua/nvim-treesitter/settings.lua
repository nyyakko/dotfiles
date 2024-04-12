local treesitter = require('nvim-treesitter')
local configs = require('nvim-treesitter.configs')

configs.setup({
    ensure_installed = { 'c', 'cpp', 'lua', 'vim', 'vimdoc', 'query' },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        disable = { 'c', 'cpp' },
        additional_vim_regex_highlighting = false,
    }
})
