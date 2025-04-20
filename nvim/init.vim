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
Plug 'SmiteshP/nvim-navic'
Plug 'MunifTanjim/nui.nvim'
Plug 'SmiteshP/nvim-navbuddy'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'goolord/alpha-nvim'
Plug 'Shatur/neovim-session-manager'
Plug 'utilyre/barbecue.nvim'
Plug 'LukasPietzschmann/telescope-tabs'
Plug 'echasnovski/mini.statusline'
Plug 'williamboman/mason.nvim'
Plug 'zaldih/themery.nvim'
Plug 'kevinhwang91/promise-async'
Plug 'kevinhwang91/nvim-ufo', { 'commit': 'aa2e676af592b4e99c105d80d6eafd1afc215d99' }
Plug 'luukvbaal/statuscol.nvim'
Plug 'julienvincent/hunk.nvim'
Plug 'rafikdraoui/jj-diffconflicts'
Plug 'saecki/live-rename.nvim'
Plug 'tpope/vim-abolish'
Plug 'lukas-reineke/indent-blankline.nvim', { 'tag': 'v3.8.2' }
Plug 'Mofiqul/vscode.nvim'
Plug 'quick-lint/quick-lint-js', {'rtp': 'plugin/vim/quick-lint-js.vim', 'tag': '3.2.0'}
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'
Plug 'norcalli/nvim-colorizer.lua'

Plug 'blazkowolf/gruber-darker.nvim'
Plug 'Shatur/neovim-ayu'
Plug 'scottmckendry/cyberdream.nvim'
Plug 'dasupradyumna/midnight.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'alexxGmZ/e-ink.nvim'

call plug#end()

lua require('settings')
lua require('themes')

lua require('plugins/dap/settings')
lua require('plugins/alpha/settings')
lua require('plugins/barbecue/settings')
lua require('plugins/cmp/settings')
lua require('plugins/hunk/settings')
lua require('plugins/lspconfig/settings')
lua require('plugins/mason/settings')
lua require('plugins/ministatus/settings')
lua require('plugins/navbuddy/settings')
lua require('plugins/session-manager/settings')
lua require('plugins/statuscol/settings')
lua require('plugins/telescope/settings')
lua require('plugins/treesitter/settings')
lua require('plugins/ufo/settings')
lua require('plugins/ibl/settings')
lua require('plugins/colorizer/settings')

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
"set lcs+=space:·
set cursorlineopt=number
set cursorline
set guifont=Iosevka\ Nerd\ Font\ Mono:h11

"hi CursorLineNr cterm=BOLD ctermbg=NONE ctermfg=NONE gui=BOLD guifg=#b9b9b9 guibg=#080c10
hi LspInlayHint guifg=#525252
