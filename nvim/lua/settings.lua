vim.keymap.set('', '<Space>', '<Nop>', { silent=true })

vim.g.mapleader = ' '

vim.keymap.set('n', '<C-w>n', ':cnext<CR>', { silent=true })
vim.keymap.set('n', '<C-w>p', ':cprev<CR>', { silent=true })

vim.keymap.set('n', '<C-t>l', ':tabnext<CR>', { silent=true })
vim.keymap.set('n', '<C-t>h', ':tabprev<CR>', { silent=true })
vim.keymap.set('n', '<C-t>m', ':tabnew<CR>', { silent=true })

vim.keymap.set('n', '<leader>ss', ':split<CR><BAR><C-w>j<CR>', { silent=true })
vim.keymap.set('n', '<leader>sv', ':vsplit<CR><BAR><C-w>l<CR>',{ silent=true })
vim.keymap.set('n', '<leader>sq', ':q!<CR>', { silent=true })

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('tree-sitter-enable', { clear = true }),
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if not lang or not vim.treesitter.language.add(lang) then return end

        if vim.treesitter.query.get(lang, 'highlights') then vim.treesitter.start(args.buf) end

        if vim.treesitter.query.get(lang, 'indents') then
            vim.opt_local.indentexpr = 'v:lua.require("nvim-treesitter").indentexpr()'
        end

        if vim.treesitter.query.get(lang, 'folds') then
            vim.opt_local.foldmethod = 'expr'
            vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        end
    end,
})
