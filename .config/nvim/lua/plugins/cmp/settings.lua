local cmp = require('cmp')
local lspkind = require('lspkind')

local formatter = function(_, item)
    item.menu = ''
    local fixed_width = 40
    local content = item.abbr

    vim.o.pumwidth = fixed_width

    local win_width = vim.api.nvim_win_get_width(0)
    local max_content_width = fixed_width and fixed_width - 10 or math.floor(win_width * 0.2)

    if #content > max_content_width then
        item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. '...'
    else
        item.abbr = content .. (' '):rep(max_content_width - #content)
    end

    return item
end

cmp.setup({
    formatting = {
        fields = { 'abbr', 'kind' },
        format = lspkind.cmp_format({
            maxwidth = 40,
            ellipsis_char = '...',
            before = formatter,
        }),
    },
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered({
            completion = { border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }, }
        }),
        documentation = cmp.config.window.bordered({
            documentation = { border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }, }
        }),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-p'] = cmp.mapping.select_prev_item(),
        ['<C-n'] = cmp.mapping.select_next_item(),
        ['<C-e'] = cmp.mapping.close(),
        ['<C-Space>'] = cmp.mapping.complete(),
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

