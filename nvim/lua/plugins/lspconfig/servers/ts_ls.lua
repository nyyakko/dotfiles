local ts_ls = {}
local capabilities = require('cmp_nvim_lsp').default_capabilities()

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

function ts_ls.configure(lspconfig)
    lspconfig.ts_ls.setup({
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
        capabilities = capabilities,
        flags = { debounce_text_changes = 150 },
        single_file_support = true
    })
end

table.insert(SERVERS.registered, ts_ls)
