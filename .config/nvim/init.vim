"::-- Latest NeoVIM Changes
set nocompatible  

call plug#begin('~/.files/.config/nvim/plug')

" Plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rking/ag.vim'
Plug 'chun-yang/auto-pairs'
Plug 'tacahiroy/ctrlp-funky'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ekalinin/dockerfile.vim'
Plug 'joshdick/onedark.vim'
Plug 'mattn/emmet-vim'
Plug 'wincent/ferret'
Plug 'scrooloose/nerdtree'
Plug 'fpob/nette.vim'
Plug 'm2mdas/phpcomplete-extended'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'tomtom/tlib_vim'
Plug 'sirver/ultisnips'
Plug 'marcweber/vim-addon-mw-utils'
Plug 'jwalton512/vim-blade'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'guenti/vim-php-cs-fixer'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'honza/vim-snippets'
Plug 'anyakichi/vim-surround'
Plug 'tpope/vim-vinegar'

call plug#end()

"--- Pathogen Plugin Manager Init
execute pathogen#infect()
call pathogen#helptags()

"--- Backspace behavior like in any other editor
set backspace=indent,eol,start 

"--- Setters
syntax on
set number relativenumber
set noswapfile
set expandtab
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set encoding=utf8
set guifont=Pragmata_Pro_Mono:h12
set laststatus=2
set scrolloff=10
set t_Co=256
highlight Normal ctermbg=None

"--- Easier split pane navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l


"---ColorTheme
 let g:dracula_italic = 0
 colorscheme onedark
 highlight Normal ctermbg=None

 if (has("termguicolors"))
   set termguicolors
 endif

"--- HTML Emmet Bind
"let g:user_emmet_expandabbr_key='<Tab>'
"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"--- Disable Arrow Keys
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

"--- PHP Namespace completion
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>


"--- NerdTree
map <A-1> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

"--- CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|vendor\'
nmap <C-r> :CtrlPBufTag<cr>

"--- Rainbow Parantheses
let g:rainbow_active = 1 

"--- Nette Settings
let g:nette_deprecated = 0

"--- PHP Syntax
let g:php_syntax_extensions_enabled = 1

"--- Python Settings
let g:python3_host_prog = '/usr/local/bin/python3'

"--- Split View Defaults
set splitbelow
set splitright

"--- Split View Movement
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"--- Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"--- Ultisnips
let g:UltiSnipsExpandTrigger="<A-2>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"--- Syntastic
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_args='--standard=PSR2 -n'

"--- PHP CodeSniffer for PSR@2
let g:php_cs_fixer_rules = "@PSR2"          
let g:php_cs_fixer_php_path = "/usr/bin/php"      " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.
let g:phpcomplete_index_composer_command = '/usr/local/bin/composer'

"--- Omnifunc
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

"--- Define some single Blade directives. This variable is used for highlighting only.
let g:blade_custom_directives = ['datetime', 'javascript']


"--- Browser like tab browsing
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

"--- Fix PSR-2 on save
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

"--- PHP Syntax Override by package php.vim

function! PhpSyntaxOverride()
  hi! link phpDocTags phpDefine
  hi! link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

