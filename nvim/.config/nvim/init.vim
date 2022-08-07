" Set Tabs / Spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" Disable Old Vi compatibility
set nocompatible

" :) syntax on
" Disable swap
set noswapfile

" Tabs to spaces
set expandtab

" Scroll Window View based on cursors position (10 lines) margin within the
" center
set scrolloff=10

" Line numbers
set relativenumber

" No Wrapping
set nowrap

" Ignore case while searching
set ignorecase

" Incremental search
set nois

" Update time
set updatetime=300

" Sign columns
set signcolumn=no

" Highlight all patterns
set hlsearch

" Disable ruler
set noruler

" No confirm on overwrite
set noconfirm

" Autosave on new file
set autowrite

call plug#begin()

if has('nvim')
else
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" LSP Completions
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'onsails/lspkind-nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'williamboman/nvim-lsp-installer'

Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'

" Tree Sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Debugger Plugins
Plug 'mfussenegger/nvim-dap'
Plug 'Pocco81/DAPInstall.nvim'
Plug 'szw/vim-maximizer'
Plug 'sebdah/vim-delve'

" Pleb Snippets
Plug 'rafamadriz/friendly-snippets'

" Go
Plug 'crispgm/nvim-go'
Plug 'rcarriga/nvim-notify'

" Garbage & Stuff
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-dispatch'
Plug 'theprimeagen/vim-be-good'
Plug 'tpope/vim-projectionist'
Plug 'tomlion/vim-solidity'
Plug 'tveskag/nvim-blame-line'
Plug 'tanvirtin/vgit.nvim'
Plug 'ahmedkhalf/project.nvim'
Plug 'nacro90/numb.nvim'
Plug 'mcauley-penney/tidy.nvim'
Plug 'jubnzv/virtual-types.nvim'

" TELESCOOOOOOOOOOOOOOOOOOOOOOPE BABY
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'folke/todo-comments.nvim'
Plug 'm-demare/hlargs.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

" prettier
Plug 'sbdchd/neoformat'

" Some other shit
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
Plug 'L3MON4D3/LuaSnip'

call plug#end()

" TreeSitter config
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}

" Git Blame by line
autocmd BufEnter * EnableBlameLine
let g:blameLineUseVirtualText = 0
let g:blameLineVirtualTextFormat = '/* %s */'

" Harpoon
nnoremap <leader>hm <cmd>lua require("harpoon.mark").add_file()<cr>
nnoremap <leader>hl <cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>

lua require("martes")

" CTRL P Alternative
nnoremap <C-p> :Telescope find_files<cr>
" TreeView Alternative
nnoremap <leader>ff <cmd>Telescope file_browser<cr>
" Search keyword in project
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" Search classes, objects, props in projet
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" Show opened editors
nnoremap <leader>edt <cmd>Telescope buffers<cr>

set encoding=UTF-8
set guifont=MesloLGM_Nerd_Font:h14

highlight Normal guibg=none
highlight NonText guibg=none

set completeopt=menu,menuone
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
