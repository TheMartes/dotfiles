" File:             indent/neon.vim
" Language:         NEON
" Maintainer:       Filip Pobořil <tsuki@fpob.eu>
" Description:      Indentation support for NEON files

if exists('b:did_indent') && b:did_indent
    finish
endif

if exists('b:nette_tab_indent')
    if b:nette_tab_indent
        setlocal noexpandtab
    else
        setlocal expandtab
    endif
endif

setlocal nosmartindent
setlocal indentexpr=GetNetteNeonIndent(v:lnum)

if exists('*GetNetteNeonIndent')
    finish
endif

function! GetNetteNeonIndent(lnum)
    let l:line = getline(a:lnum)
    let l:prev_lnum = a:lnum - 1
    let l:prev_line = l:prev_lnum > 0 ? getline(l:prev_lnum) : ''

    let l:indent = indent(l:prev_lnum)

    if l:prev_line =~? '\v^\s*(\w|\.)+:$'
        let l:indent += &shiftwidth
    elseif l:prev_line ==? ''
        let l:indent = indent(l:prev_lnum - 1)
        if l:indent > &shiftwidth
            let l:indent -= &shiftwidth
        endif
        if l:indent < 0
            let l:indent = 0
        endif
    endif

    return l:indent
endfunction

let b:did_indent = 1
