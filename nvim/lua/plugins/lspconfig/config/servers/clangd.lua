clangd = {}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

function clangd.configure(lspconfig)
    lspconfig.clangd.setup({
        root_dir = function (fname)
            return lspconfig.util.root_pattern('compile_commands.json')(fname) or lspconfig.util.find_git_ancestor(fname) or vim.fn.getcwd()
        end,
        on_attach = function (client, bufnr)
            if (client.server_capabilities.documentSymbolProvider) then
                require('nvim-navbuddy').attach(client, bufnr)
            end
        end,
        -- cmd = { 'clangd-17', '-j=4', '--malloc-trim', '--background-index', '--completion-style=detailed', '--query-driver=' .. vim.fn.getcwd() .. '/Toolchain/Local/**/*' },
        cmd = { 'clangd', '-j=4', '--background-index', '--completion-style=detailed' },
        capabilities = capabilities,
        flags = { debounce_text_changes = 150 },
        single_file_support = true
    })
end

