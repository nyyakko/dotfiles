call plug#begin()

" Plugins

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'tag': 'master', 'do': ':TSUpdate' }
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp', { 'tag': 'v0.0.2' }
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'MunifTanjim/nui.nvim'
Plug 'SmiteshP/nvim-navic'
Plug 'SmiteshP/nvim-navbuddy'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'goolord/alpha-nvim'
Plug 'Shatur/neovim-session-manager'
Plug 'LukasPietzschmann/telescope-tabs'
Plug 'echasnovski/mini.statusline'
Plug 'williamboman/mason.nvim'
Plug 'zaldih/themery.nvim'
Plug 'kevinhwang91/promise-async'
Plug 'kevinhwang91/nvim-ufo', { 'commit': 'aa2e676af592b4e99c105d80d6eafd1afc215d99' }
Plug 'luukvbaal/statuscol.nvim'
Plug 'julienvincent/hunk.nvim'
Plug 'saecki/live-rename.nvim'
Plug 'tpope/vim-abolish'
Plug 'lukas-reineke/indent-blankline.nvim', { 'tag': 'v3.8.2' }
Plug 'quick-lint/quick-lint-js', { 'rtp': 'plugin/vim/quick-lint-js.vim', 'tag': '3.2.0' }
Plug 'nvim-neotest/nvim-nio'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'kylechui/nvim-surround'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
Plug 'MeanderingProgrammer/render-markdown.nvim'
Plug 'rachartier/tiny-code-action.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'utilyre/barbecue.nvim'
Plug 'onsails/lspkind.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'rafikdraoui/jj-diffconflicts'
Plug 'hat0uma/csvview.nvim'

" Themes

Plug 'cpea2506/one_monokai.nvim'
Plug 'Mofiqul/vscode.nvim'
Plug 'blazkowolf/gruber-darker.nvim'
Plug 'Shatur/neovim-ayu'
Plug 'rebelot/kanagawa.nvim'
Plug 'dasupradyumna/midnight.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'alexxGmZ/e-ink.nvim'
Plug 'rktjmp/lush.nvim'
Plug 'rockyzhang24/arctic.nvim'
Plug 'Mofiqul/adwaita.nvim'
Plug 'projekt0n/github-nvim-theme'
Plug 'yorumicolors/yorumi.nvim'
Plug 'brargenzilian/darcula-solid.nvim'

call plug#end()

lua << config
vim.keymap.set('', '<Space>', '<Nop>', { silent=true })

vim.g.mapleader = ' '

vim.keymap.set('n', '<C-t>l', ':tabnext<CR>', { silent=true })
vim.keymap.set('n', '<C-t>h', ':tabprev<CR>', { silent=true })
vim.keymap.set('n', '<C-t>m', ':tabnew<CR>', { silent=true })

vim.keymap.set('n', '<leader>ss', ':split<CR><BAR><C-w>j<CR>', { silent=true })
vim.keymap.set('n', '<leader>sv', ':vsplit<CR><BAR><C-w>l<CR>',{ silent=true })
vim.keymap.set('n', '<leader>sq', ':q!<CR>', { silent=true })
config

lua require('plugins/themery/settings')

lua require('plugins/alpha/settings')
lua require('plugins/barbecue/settings')
lua require('plugins/cmp/settings')
lua require('plugins/colorizer/settings')
lua require('plugins/hunk/settings')
lua require('plugins/ibl/settings')
lua require('plugins/lspconfig/settings')
lua require('plugins/mason/settings')
lua require('plugins/ministatus/settings')
lua require('plugins/navbuddy/settings')
lua require('plugins/render-markdown/settings')
lua require('plugins/session-manager/settings')
lua require('plugins/statuscol/settings')
lua require('plugins/surround/settings')
lua require('plugins/telescope/settings')
lua require('plugins/tiny-code-action/settings')
lua require('plugins/treesitter/settings')
lua require('plugins/ufo/settings')
lua require('plugins/tree/settings')

set nowrap
set cmdheight=0
set tabstop=4
set shiftwidth=4
set expandtab
set number
set relativenumber
set mouse=a
set list
set cursorlineopt=number
set cursorline
