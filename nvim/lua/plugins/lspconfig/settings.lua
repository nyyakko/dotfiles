require('plugins/lspconfig/servers')

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        local opts = { silent = true, buffer = ev.buf }
        local keymap = vim.keymap.set
        keymap('n', 'gD', vim.lsp.buf.declaration, opts)
        keymap('n', 'gd', vim.lsp.buf.definition, opts)
        keymap('n', 'gr', vim.lsp.buf.references, opts)
        keymap('n', 'K', vim.lsp.buf.hover, opts)
        keymap('n', 'gi', vim.lsp.buf.implementation, opts)
        keymap('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        keymap('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        keymap('n', '<leader>rn', vim.lsp.buf.rename, opts)
        keymap({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        keymap('n', '<leader>dn', ':lua vim.diagnostic.goto_next()<CR>', opts)
        keymap('n', '<leader>dp', ':lua vim.diagnostic.goto_prev()<CR>', opts)
        keymap('n', '<leader>df', ':lua vim.diagnostic.open_float()<CR>', opts)
        keymap('n', '<leader>mk', ':Navbuddy<CR>', opts)
        keymap('n', '<leader>tl', ':lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>')
    end
})

require('lspconfig.ui.windows').default_options.border = 'rounded'

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

vim.diagnostic.config({
    underline = true,
    virtual_text = false,
    update_in_insert = true,
    float = { border = 'rounded' },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN]  = '',
            [vim.diagnostic.severity.INFO]  = '',
            [vim.diagnostic.severity.HINT]  = '',
        }
    }
})

SERVERS.configure()
