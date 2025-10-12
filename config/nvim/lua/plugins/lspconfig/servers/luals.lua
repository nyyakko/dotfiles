local luals = {}
local capabilities = require('cmp_nvim_lsp').default_capabilities()

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

function luals.configure(lspconfig)
    lspconfig.lua_ls.setup({
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
        settings = { Lua = {} },
        capabilities = capabilities,
        flags = { debounce_text_changes = 150 },
        single_file_support = true
    })
end

table.insert(SERVERS.registered, luals)
