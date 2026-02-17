local capabilities = require('cmp_nvim_lsp').default_capabilities()

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

table.insert(SERVERS.registered, {
    'lua_ls', {
        on_init = function(client)
            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                runtime = {
                    version = 'LuaJIT'
                },
                workspace = {
                    checkThirdParty = false,
                    library = { vim.env.VIMRUNTIME }
                }
            })
        end,
        on_attach = function (client, bufnr)
            if (client.server_capabilities.documentSymbolProvider) then
                require('nvim-navbuddy').attach(client, bufnr)
            end
        end,
        capabilities = capabilities,
        flags = { debounce_text_changes = 150 },
        single_file_support = true,
        settings = { Lua = {} },
    }
})
