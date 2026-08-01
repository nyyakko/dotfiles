local lint = require('lint')

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  callback = function()
    lint.try_lint()
  end,
})

lint.linters_by_ft = {
    cpp = { 'cppcheck', 'clangtidy' },
    typescriptreact = { 'quick-lint-js' },
    typescript = { 'quick-lint-js' },
    -- python = { 'mypy' }
}

lint.linters.cppcheck.args = { '--check-level=exhaustive' }
