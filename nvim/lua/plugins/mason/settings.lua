local mason = require('mason')

mason.setup({
    ui = {
        border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = ""
        }
    }
})

