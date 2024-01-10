local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    window = {},
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-p'] = cmp.mapping.select_prev_item(),
        ['<C-n'] = cmp.mapping.select_next_item(),
        ['<C-e'] = cmp.mapping.close(),
        ['<Shift-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm { select = true }
    }),
    -- mapping = cmp.mapping.preset.insert({
    --     ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    --     ['<C-f>'] = cmp.mapping.scroll_docs(4),
    --     ['<C-Space>'] = cmp.mapping.complete(),
    --     ['<C-e>'] = cmp.mapping.abort(),
    --     ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    -- }),
    sources = cmp.config.sources({{ name = 'nvim_lsp' }, { name = 'vsnip' }}, {{ name = 'buffer' }})
})

cmp.setup {
    window = {
        completion = { -- rounded border; thin-style scrollbar
        border = 'single',
        scrollbar = '║',
    },
    documentation = { -- no border; native-style scrollbar
        border = 'single',
        scrollbar = '',
    },
  },
}

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

