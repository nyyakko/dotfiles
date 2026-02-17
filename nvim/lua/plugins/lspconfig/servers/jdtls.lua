local capabilities = require('cmp_nvim_lsp').default_capabilities()

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

local lombok = vim.fn.stdpath('config') .. '/lua/plugins/lspconfig/runtime/lombok.jar'

table.insert(SERVERS.registered, {
    'jdtls', {
        cmd = {
            'jdtls',
            '-configuration', vim.fn.expand('$HOME/.cache/jdtls/config'),
            '-data', vim.fn.expand('$HOME/.cache/jdtls/workspace'),
            '--jvm-arg=-javaagent:' .. lombok,
            '--jvm-arg=-Xbootclasspath/a:' .. lombok
        },
        on_attach = function (client, bufnr)
            if (client.server_capabilities.documentSymbolProvider) then
                require('nvim-navbuddy').attach(client, bufnr)
            end
        end,
        capabilities = capabilities,
        flags = { debounce_text_changes = 150 },
        single_file_support = true,
        init_options = {
            bundles = {
                vim.fn.expand('$HOME') .. '/.m2/repository/com/microsoft/java/com.microsoft.java.debug.plugin/0.53.1/com.microsoft.java.debug.plugin-0.53.1.jar'
            }
        },
    }
})
