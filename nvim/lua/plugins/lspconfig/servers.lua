SERVERS = {
    registered = {}
}

require('plugins/lspconfig/servers/texlab')
require('plugins/lspconfig/servers/clangd')
require('plugins/lspconfig/servers/cmake')
require('plugins/lspconfig/servers/cssls')
require('plugins/lspconfig/servers/dartls')
require('plugins/lspconfig/servers/dockerls')
require('plugins/lspconfig/servers/html')
require('plugins/lspconfig/servers/jdtls')
require('plugins/lspconfig/servers/jsonls')
require('plugins/lspconfig/servers/luals')
require('plugins/lspconfig/servers/pylsp')
require('plugins/lspconfig/servers/ts_ls')

function SERVERS.configure()
    for _, server in ipairs(SERVERS.registered) do
        server.configure(require('lspconfig'))
    end
end
