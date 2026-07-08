local capabilities = require('cmp_nvim_lsp').default_capabilities()
local schema_companion = require('schema-companion')

schema_companion.setup({})

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

table.insert(SERVERS.registered, {
    'yamlls', schema_companion.setup_client(
        schema_companion.adapters.yamlls.setup({
            sources = {
                schema_companion.sources.matchers.backstage.setup({ version = 'latest' }),
                schema_companion.sources.matchers.kubernetes.setup({ version = 'master' }),
            },
        }),
        {
            on_attach = function (client, bufnr)
                if (client.server_capabilities.documentSymbolProvider) then
                    require('nvim-navbuddy').attach(client, bufnr)
                end
            end,
            capabilities = capabilities,
            flags = { debounce_text_changes = 150 },
            single_file_support = true,
            settings = {
                yaml = {
                    trace = {
                        server = 'verbose'
                    },
                    schemaStore = { enable = false },
                    schemaDownload = { enable = false },
                    validate = true,
                }
            },
    })
})
