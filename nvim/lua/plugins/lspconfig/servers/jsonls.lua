local capabilities = require('cmp_nvim_lsp').default_capabilities()

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

table.insert(SERVERS.registered, {
    'jsonls', {
        on_attach = function (client, bufnr)
            if (client.server_capabilities.documentSymbolProvider) then
                require('nvim-navbuddy').attach(client, bufnr)
            end
        end,
        capabilities = capabilities,
        settings = {
            json = {
                schemas = {
                    {
                        fileMatch = { 'CMakePresets.json' },
                        url = 'https://raw.githubusercontent.com/Kitware/CMake/master/Help/manual/presets/schema.json'
                    }
                }
            }
        },
        flags = { debounce_text_changes = 150 },
        single_file_support = true
    }
})
