local lspconfig = require('lspconfig')
local keymap = vim.keymap.set

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        local opts = { silent = true, buffer = ev.buf }

        keymap('n', 'gD', vim.lsp.buf.declaration, opts)
        keymap('n', 'gd', vim.lsp.buf.definition, opts)
        keymap('n', 'gr', vim.lsp.buf.references, opts)
        keymap('n', 'K', vim.lsp.buf.hover, opts)
        keymap('n', 'gi', vim.lsp.buf.implementation, opts)
        keymap('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        keymap('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        keymap('n', '<leader>rn', vim.lsp.buf.rename, opts)
        keymap({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        keymap('n', '<leader>F', function() vim.lsp.buf.format { async = true } end, opts)
        keymap('n', '<leader>dn', ':lua vim.diagnostic.goto_next()<CR>', opts)
        keymap('n', '<leader>dp', ':lua vim.diagnostic.goto_prev()<CR>', opts)
        keymap('n', '<leader>df', ':lua vim.diagnostic.open_float()<CR>', opts)
        keymap("n", "<leader>mk", ":Navbuddy<CR>", opts)
        keymap("n", "<leader>tl", ":lua vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())<CR>")
    end
})

require('lspconfig.ui.windows').default_options.border = 'rounded'
vim.lsp.handlers['textDocument/hover']                 = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
vim.lsp.handlers['textDocument/signatureHelp']         = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })
vim.lsp.handlers['textDocument/publishDiagnostics']    = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false, update_in_insert = true })
vim.diagnostic.config({ float = { border = 'single' } })

function on_attach(client, bufnr)
    if (client.server_capabilities.documentSymbolProvider) then
        require('nvim-navbuddy').attach(client, bufnr)
    end
end

function root_dir(fname)
    return lspconfig.util.root_pattern('compile_commands.json')(fname)
                or lspconfig.util.find_git_ancestor(fname)
                or vim.fn.getcwd()
end

lspconfig.clangd.setup({
    on_attach    = on_attach,
    root_dir     = root_dir,
    cmd          = { 'clangd', '-j = 4', '--background-index' },
    -- cmd          = { 'clangd-17', '-j=4', '--malloc-trim', '--background-index', '--query-driver=' .. vim.fn.getcwd() .. '/Toolchain/Local/**/*' },
    filetypes    = { "c", "cpp" },
    flags        = { debounce_text_changes = 150 },
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    single_file_support = true
})

for _, serverName in ipairs({ 'tsserver', 'hls', 'cmake', 'glsl_analyzer' }) do
    lspconfig[serverName].setup({
        root_dir     = root_dir,
        on_attach    = on_attach,
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        flags        = { debounce_text_changes = 150 }
    })
end
