local pylsp = {}
local capabilities = require('cmp_nvim_lsp').default_capabilities()

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

function pylsp.configure(lspconfig)
    lspconfig.pylsp.setup({
        root_dir = function (fname)
            return
                lspconfig.util.root_pattern('compile_commands.json')(fname) or
                lspconfig.util.find_git_ancestor(fname) or
                vim.fn.getcwd()
        end,
        on_attach = function (client, bufnr)
            if (client.server_capabilities.documentSymbolProvider) then
                require('nvim-navbuddy').attach(client, bufnr)
            end
        end,
        settings = {
            pylsp = {
                plugins = {
                    pycodestyle = { enabled = false }
                }
            }
        },
        capabilities = capabilities,
        flags = { debounce_text_changes = 150 },
        single_file_support = true
    })
end

table.insert(SERVERS.registered, pylsp)
