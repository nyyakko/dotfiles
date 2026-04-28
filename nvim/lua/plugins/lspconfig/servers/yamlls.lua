local capabilities = require('cmp_nvim_lsp').default_capabilities()
local schema_companion = require('schema-companion')

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

table.insert(SERVERS.registered, {
    'yamlls', schema_companion.setup_client(
        schema_companion.adapters.yamlls.setup({
            sources = {
                require('schema-companion').sources.matchers.kubernetes.setup({ version = 'master' }),
                require('schema-companion').sources.lsp.setup(),
                require('schema-companion').sources.schemas.setup({
                    {
                        name = 'Kubernetes master',
                        uri = 'https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master-standalone-strict/all.json',
                    },
                }),
            },
        }), {
        on_attach = function (client, bufnr)
            if (client.server_capabilities.documentSymbolProvider) then
                require('nvim-navbuddy').attach(client, bufnr)
            end
        end,
        capabilities = capabilities,
        flags = { debounce_text_changes = 150 },
        single_file_support = true,
        settings = {
            yaml = {
                trace = {
                    server = 'verbose'
                },
                schemas = {
                    -- kubernetes = '*.yaml',
                    -- ['http://json.schemastore.org/github-workflow'] = '.github/workflows/*',
                    -- ['http://json.schemastore.org/github-action'] = '.github/action.{yml,yaml}',
                    -- ['http://json.schemastore.org/ansible-stable-2.9'] = 'roles/tasks/*.{yml,yaml}',
                    -- ['http://json.schemastore.org/prettierrc'] = '.prettierrc.{yml,yaml}',
                    -- ['http://json.schemastore.org/kustomization'] = 'kustomization.{yml,yaml}',
                    -- ['http://json.schemastore.org/ansible-playbook'] = '*play*.{yml,yaml}',
                    -- ['http://json.schemastore.org/chart'] = 'Chart.{yml,yaml}',
                    -- ['https://json.schemastore.org/dependabot-v2'] = '.github/dependabot.{yml,yaml}',
                    -- ['https://json.schemastore.org/gitlab-ci'] = '*gitlab-ci*.{yml,yaml}',
                    -- ['https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json'] = '*api*.{yml,yaml}',
                    -- ['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = '*docker-compose*.{yml,yaml}',
                    -- ['https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json'] = '*flow*.{yml,yaml}',
                },
                schemaDownload = { enable = true },
                validate = true,
            }
        },
    })
})
