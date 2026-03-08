local lint = require('lint')

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  callback = function()
    require('lint').try_lint()
  end,
})

lint.linters_by_ft = {
    cpp = { 'cppcheck' },
    typescriptreact = { 'quick-lint-js' },
    typescript = { 'quick-lint-js' }
}
