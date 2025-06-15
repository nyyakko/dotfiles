require('plugins/lspconfig/servers')

require('lspconfig.ui.windows').default_options.border = 'rounded'

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        local opts = { silent=true, buffer=ev.buf }
        local map = vim.keymap.set
        map({ 'n' }, 'gF', vim.lsp.buf.format, opts)
        map({ 'n' }, 'gi', vim.lsp.buf.implementation, opts)
        map({ 'n' }, 'gD', vim.lsp.buf.declaration, opts)
        map({ 'n' }, 'gd', vim.lsp.buf.definition, opts)
        map({ 'n' }, 'gr', vim.lsp.buf.references, opts)
        map({ 'n' }, 'K', function () vim.lsp.buf.hover { border='rounded', max_width = 100 } end, opts)
        map({ 'n' }, '<C-k>', function () vim.lsp.buf.signature_help { border='rounded', max_width = 100 } end, opts)
        map({ 'n' }, '<leader>rn', (function (_opts) return function() require("live-rename").rename(_opts) end end)({}), opts)
        map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        map({ 'n' }, '<leader>dn', function () vim.diagnostic.jump({ count=1, float=true }) end, opts)
        map({ 'n' }, '<leader>dp', function () vim.diagnostic.jump({ count=-1, float=true }) end, opts)
        map({ 'n' }, '<leader>df', function () vim.diagnostic.open_float() end, opts)
        map({ 'n' }, '<leader>tl', function () vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end)
        map({ 'n' }, '<leader>mk', ':Navbuddy<CR>', opts)
    end
})

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
