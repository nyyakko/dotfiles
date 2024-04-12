local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered({
            completion = {
                border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
            }
        }),
        documentation = cmp.config.window.bordered({
            documentation = {
                border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
            }
        }),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-p'] = cmp.mapping.select_prev_item(),
        ['<C-n'] = cmp.mapping.select_next_item(),
        ['<C-e'] = cmp.mapping.close(),
        ['<Shift-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm { select = true }
    }),
    sources = cmp.config.sources({{ name = 'nvim_lsp' }, { name = 'vsnip' }}, {{ name = 'buffer' }})
})

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({{ name = 'git' }}, {{ name = 'buffer' }})
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {{ name = 'buffer' }}
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({{ name = 'path' }}, {{ name = 'cmdline' }})
})

