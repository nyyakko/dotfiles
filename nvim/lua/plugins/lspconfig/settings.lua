require('plugins/lspconfig/servers')

local map = vim.keymap.set

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        local opts = { silent = true, buffer = ev.buf }
        map('n', 'gD', vim.lsp.buf.declaration, opts)
        map('n', 'gd', vim.lsp.buf.definition, opts)
        map('n', 'gr', vim.lsp.buf.references, opts)
        map('n', 'K', vim.lsp.buf.hover, opts)
        map('n', 'gi', vim.lsp.buf.implementation, opts)
        map('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        map('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        -- map('n', '<leader>rn', vim.lsp.buf.rename, opts)
        map('n', '<leader>rn', (function (_opts)
            return function()
                require("live-rename").rename(_opts)
            end
        end)({}), opts)
        map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        map('n', '<leader>dn', ':lua vim.diagnostic.goto_next()<CR>', opts)
        map('n', '<leader>dp', ':lua vim.diagnostic.goto_prev()<CR>', opts)
        map('n', '<leader>df', ':lua vim.diagnostic.open_float()<CR>', opts)
        map('n', '<leader>mk', ':Navbuddy<CR>', opts)
        map('n', '<leader>tl', ':lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>')
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

SERVERS.configure();
