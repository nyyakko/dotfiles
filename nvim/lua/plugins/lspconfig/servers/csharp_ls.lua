local capabilities = require('cmp_nvim_lsp').default_capabilities()

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

table.insert(SERVERS.registered, {
    'csharp_ls', {
        on_attach = function (client, bufnr)
            if (client.server_capabilities.documentSymbolProvider) then
                require('nvim-navbuddy').attach(client, bufnr)
            end
        end,
        capabilities = capabilities,
        flags = { debounce_text_changes = 150 },
        single_file_support = true
    }
})
