execute pathogen#infect()
call pathogen#helptags()

syntax on
set number relativenumber
set noswapfile
set noshowmode
set expandtab
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set encoding=utf8
set guifont=Hack_Nerd_Font:h12
set laststatus=2
set scrolloff=10
let g:dracula_italic = 0
let g:dracula_colorterm = 0
highlight Normal ctermbg=None
colorscheme dracula

" Vim status line
if !has('gui_running')
  set t_Co=256
endif
set laststatus=2


" VIM Lightline theme
let g:lightline = {
      \ 'colorscheme': 'Dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" Keybinds
map <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:rainbow_active = 1 
let g:nette_deprecated = 0
let g:php_syntax_extensions_enabled = 1
"
" PHP CodeSniffer for PSR@2
"
let g:php_cs_fixer_rules = "@PSR2"          " options: --rules (default:@PSR2)
"let g:php_cs_fixer_cache = ".php_cs.cache" " options: --cache-file
"let g:php_cs_fixer_config_file = '.php_cs' " options: --config
" End of php-cs-fixer version 2 config params

let g:php_cs_fixer_php_path = "/usr/bin/php"      " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.
let g:phpcomplete_index_composer_command = '/usr/local/bin/composer'

autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" Define some single Blade directives. This variable is used for highlighting only.
let g:blade_custom_directives = ['datetime', 'javascript']

