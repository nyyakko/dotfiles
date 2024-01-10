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

lua vim.keymap.set("", "<Space>", "<Nop>", ops)
lua vim.g.mapleader = " "

lua require('alpha_settings')
lua require('cmp_settings')
lua require('lsp_settings')
lua require('winshift_settings')
lua require('telescope_settings')
lua require('toggleterm_settings')
lua require('ts_settings')
" lua require('ufo_settings')

:lua << EOF

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '>', right = '<'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})

require('session_manager').setup({
    sessions_dir = require('plenary.path'):new(vim.fn.stdpath('data'), 'sessions'),
    session_filename_to_dir = session_filename_to_dir,
    dir_to_session_filename = dir_to_session_filename,
    autoload_mode = require('session_manager.config').AutoloadMode.Disabled,
    autosave_last_session = true,
    autosave_ignore_not_normal = true,
    autosave_ignore_dirs = {},
    autosave_ignore_filetypes = {
      'gitcommit',
      'gitrebase',
    },
    autosave_ignore_buftypes = {},
    autosave_only_in_session = false,
    max_path_length = 80,
})

local keymap = vim.keymap.set
local opts = { silent = true }

keymap('n', '<leader>ss', ':split<CR><BAR><C-w>j<CR>', opts)
keymap('n', '<leader>sv', ':vsplit<CR><BAR><C-w>l<CR>', opts)
keymap('n', '<leader>sq', ':q<CR>', opts)

EOF

colorscheme midnight

hi Folded guibg=#080c10
hi Folded guifg=#434343

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
hi CursorLineNr cterm=BOLD ctermbg=NONE ctermfg=NONE gui=BOLD guifg=#b9b9b9 guibg=#080c10
set cursorline
