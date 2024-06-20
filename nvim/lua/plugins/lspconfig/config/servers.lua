require('plugins/lspconfig/config/servers/clangd')
require('plugins/lspconfig/config/servers/quicklintjs')

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

local capabilities = require('cmp_nvim_lsp').default_capabilities()

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

servers = {}

function servers.configure(lspconfig)
    clangd.configure(lspconfig)
    quicklintjs.configure(lspconfig)

    local available = {
        'pylsp', 'jdtls', 'jsonls', 'html', 'cssls', 'tsserver', 'hls', 'cmake'
    }

    for _, serverName in ipairs(available) do
        lspconfig[serverName].setup({
            root_dir = function (fname)
                return lspconfig.util.root_pattern('compile_commands.json')(fname) or lspconfig.util.find_git_ancestor(fname) or vim.fn.getcwd()
            end,
            on_attach = function (client, bufnr)
                if (client.server_capabilities.documentSymbolProvider) then
                    require('nvim-navbuddy').attach(client, bufnr)
                end
            end,
            capabilities = capabilities,
            flags = { debounce_text_changes = 150 },
            single_file_support = true
        })
    end
end

