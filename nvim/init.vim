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
Plug 'akinsho/toggleterm.nvim', { 'tag' : '*'}
Plug 'SmiteshP/nvim-navic'
Plug 'MunifTanjim/nui.nvim'
Plug 'SmiteshP/nvim-navbuddy'
Plug 'nvim-lualine/lualine.nvim'
Plug 'godlygeek/tabular'
Plug 'neoclide/coc.nvim', { 'branch': 'release'}
Plug 'sindrets/diffview.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'goolord/alpha-nvim'
Plug 'Shatur/neovim-session-manager'
Plug 'roman/golden-ratio'
Plug 'sindrets/winshift.nvim'
Plug 'tpope/vim-fugitive'

Plug 'dasupradyumna/midnight.nvim'
Plug 'ramojus/mellifluous.nvim'
Plug 'projekt0n/github-nvim-theme'
Plug 'Mofiqul/vscode.nvim'
Plug 'martinsione/darkplus.nvim'

call plug#end()

lua require('base')

lua require('nvim-alpha/settings')
lua require('nvim-cmp/settings')
lua require('nvim-lspconfig/settings')
lua require('nvim-winshift/settings')
lua require('nvim-telescope/settings')
lua require('nvim-toggleterm/settings')
lua require('nvim-treesitter/settings')
lua require('nvim-lualine/settings')
lua require('nvim-session-manager/settings')

colorscheme midnight

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

hi CursorLineNr cterm=BOLD ctermbg=NONE ctermfg=NONE gui=BOLD guifg=#b9b9b9 guibg=#080c10
