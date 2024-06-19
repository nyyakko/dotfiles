call plug#begin()

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'akinsho/toggleterm.nvim', { 'tag' : '*' }
Plug 'SmiteshP/nvim-navic'
Plug 'MunifTanjim/nui.nvim'
Plug 'SmiteshP/nvim-navbuddy'
Plug 'godlygeek/tabular'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'nvim-tree/nvim-web-devicons'
Plug 'goolord/alpha-nvim'
Plug 'Shatur/neovim-session-manager'
Plug 'roman/golden-ratio'
Plug 'utilyre/barbecue.nvim'
Plug 'LukasPietzschmann/telescope-tabs'
Plug 'echasnovski/mini.statusline'
Plug 'williamboman/mason.nvim'
Plug 'zaldih/themery.nvim'
Plug 'quick-lint/quick-lint-js', {'rtp': 'plugin/vim/quick-lint-js.vim', 'tag': '3.2.0'}

Plug 'Shatur/neovim-ayu'
Plug 'Mofiqul/vscode.nvim'
Plug 'scottmckendry/cyberdream.nvim'
Plug 'dasupradyumna/midnight.nvim'
Plug 'ellisonleao/gruvbox.nvim'

call plug#end()

lua require('base')
lua require('themes/themes')

lua require('plugins/mason/settings')
lua require('plugins/ministatus/settings')
lua require('plugins/alpha/settings')
lua require('plugins/cmp/settings')
lua require('plugins/navbuddy/settings')
lua require('plugins/lspconfig/settings')
lua require('plugins/telescope/settings')
lua require('plugins/toggleterm/settings')
lua require('plugins/treesitter/settings')
lua require('plugins/session-manager/settings')
lua require('plugins/barbecue/settings')

set nowrap
set cmdheight=0
set termguicolors
set tabstop=4
set shiftwidth=4
set expandtab
set number
set relativenumber
set mouse=a
set list
set lcs+=space:·
set cursorlineopt=number
set cursorline

"hi CursorLineNr cterm=BOLD ctermbg=NONE ctermfg=NONE gui=BOLD guifg=#b9b9b9 guibg=#080c10
hi LspInlayHint guifg=#525252
