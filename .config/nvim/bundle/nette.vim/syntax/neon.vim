" File:             syntax/neon.vim
" Language:         NEON
" Maintainer:       Filip Pobořil <tsuki@fpob.eu>
" Description:      NEON syntax highlighting

if exists('b:current_syntax') && b:current_syntax ==? 'neon'
    finish
endif

if exists('b:nette_tab_indent')
    if b:nette_tab_indent
        syn match neonError /^ \+/
    else
        syn match neonError /^	\+/
    endif
endif

syn keyword neonTodo contained TODO FIXME XXX
syn region neonComment oneline start=/#/ end=/$/ contains=neonTodo

syn keyword neonBoolean true True TRUE yes Yes YES on On ON
syn keyword neonBoolean false False FALSE no No NO off Off OFF
syn keyword neonConstant null Null NULL

syn match neonNumber /\(\s\|=\)\@<=[+-]\?\(\([0-9]\+\|0x[0-9a-fA-F]\+\)\|\([0-9]*\.[0-9]\+\)\)\(\s\|$\|,\)\@=/
syn match neonString /\('[^'\n]*'\|"[^"\n]*"\)/ contains=neonIdentifier

syn match neonDelimiter "[[{()}\],]"
syn match neonOperator /\(\(^\s*\)\@<=- \|[*=:]\|\.\.\.\|::\)/

syn match neonStructure /\(^\s*\(-\s*\)\?\)\@<=\(\w\|[.-]\)\+:\@=/
syn region neonIdentifier oneline start=/%/ end=/%/
syn match neonFunction /@\(\w\|\\\|\.\)\+/

hi def link neonError Error
hi def link neonTodo Todo
hi def link neonComment Comment
hi def link neonBoolean Boolean
hi def link neonConstant Constant
hi def link neonNumber Number
hi def link neonString String
hi def link neonDelimiter Delimiter
hi def link neonOperator Operator
hi def link neonStructure Structure
hi def link neonIdentifier Identifier
hi def link neonFunction Function

let b:current_syntax = 'neon'
