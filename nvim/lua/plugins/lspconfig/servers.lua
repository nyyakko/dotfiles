SERVERS = {
    registered = {}
}

require('plugins/lspconfig/servers/clangd')
require('plugins/lspconfig/servers/cmake')
require('plugins/lspconfig/servers/csharp_ls')
require('plugins/lspconfig/servers/cssls')
require('plugins/lspconfig/servers/dartls')
require('plugins/lspconfig/servers/dockerls')
require('plugins/lspconfig/servers/glsl_analyzer')
require('plugins/lspconfig/servers/gopls')
require('plugins/lspconfig/servers/html')
require('plugins/lspconfig/servers/jdtls')
require('plugins/lspconfig/servers/jedi')
require('plugins/lspconfig/servers/jsonls')
require('plugins/lspconfig/servers/kotlin_lsp')
require('plugins/lspconfig/servers/luals')
require('plugins/lspconfig/servers/marksman')
require('plugins/lspconfig/servers/quicklintjs')
require('plugins/lspconfig/servers/tailwindcss')
require('plugins/lspconfig/servers/ts_ls')

function SERVERS.configure()
    for _, server in ipairs(SERVERS.registered) do
        local name = server[1]
        local config = server[2]
        vim.lsp.enable(name)
        if config ~= nil then
            vim.lsp.config(name, config)
        end
    end
end
