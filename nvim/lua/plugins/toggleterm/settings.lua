local toggleterm = require('toggleterm')

toggleterm.setup({
    size = 10,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    close_on_exit = true,
    shell = vim.o.shell,
    highlights = {
        FloatBorder = {
          guifg = '#393939'
        },
    }
})
