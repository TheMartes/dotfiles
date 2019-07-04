" File:             syntax/latte
" Language:         Latte
" Maintainer:       Filip Pobořil <tsuki@fpob.eu>
" Description:      Latte syntax highlighting

if exists('b:current_syntax') && b:current_syntax ==? 'latte'
    finish
endif

if !exists('g:nette_deprecated')
    let g:nette_deprecated = 999
endif

if match(&filetype, '\.') >= 0
    let b:current_subsyntax = split(&filetype, '\.')[0]
else
    let b:current_subsyntax = 'html'
endif

execute "runtime! syntax/" . b:current_subsyntax . ".vim"
unlet! b:current_syntax

syntax include @PHP syntax/php.vim

syn region latteJavaScript keepend start=/\m<script[^>]*>/ end=/\m<\/script[^>]*>/me=s-1 contains=javaScript
syn region latteCssStyle keepend start=/\m<style[^>]*>/ end=/\m<\/style>/ contains=cssStyle

syn keyword latteKeyword contained include cache php use l r contentType status
syn keyword latteKeyword contained var default capture
syn keyword latteKeyword contained block define includeblock layout extends import
syn keyword latteKeyword contained control form formContainer label input inputError snippet snippetArea
syn keyword latteKeyword contained link plink syntax
syn keyword latteConditional contained if elseif else ifset elseifset ifCurrent
syn keyword latteRepeat contained foreach as for while continueIf breakIf first last sep
syn keyword latteDebug contained dump debugbreak

syn cluster latteExpression contains=latteMacroPhpCode,latteKeyword,latteConditional,latteRepeat,latteDebug,latteMacroIdentifier,latteMacroLink,latteMacroOperator,latteMacroFilter,latteMacroDelimiter,latteError

syn region latteMacro matchgroup=latteOperator keepend start=/\m{[%{]\@!\/\?/ end=/\m\/\?[%{]\@!}/ contains=@latteExpression

if g:nette_deprecated >= 204
    syn region latteMacro matchgroup=latteDeprecated keepend start=/\m{{\/\?/ end=/\m\/\?}}/ contains=@latteExpression
    syn region latteMacro matchgroup=latteDeprecated keepend start=/\m{%\/\?/ end=/\m\/\?%}/ contains=@latteExpression
else
    syn region latteMacro matchgroup=latteOperator keepend start=/\m{{\/\?/ end=/\m\/\?}}/ contains=@latteExpression
    syn region latteMacro matchgroup=latteOperator keepend start=/\m{%\/\?/ end=/\m\/\?%}/ contains=@latteExpression
endif

syn match latteMacroOperator contained /\m\(|\|=>\)/
syn match latteMacroDelimiter contained /\m[,:]/
syn match latteMacroIdentifier contained /\m\(\({[{%]\@!\|{{\|{%\)[a-zA-Z]\+\s\)\@<=\h[a-zA-Z0-9_:-]*\([/%} ,|].*\)\@=/
syn match latteMacroIdentifier contained /\m\(,\s*\)\@<=\(\h\w*\)\(\s\|=\)\@=/
syn match latteMacroLink contained /\m\(\({[{%]\@!\|{{\|{%\)\(link\|plink\)\s\)\@<=\S\+!\?/
syn match latteMacroFilter contained /\m\([^|]|\)\@<=\h\w*\(:\@=\)\?/
syn match latteMacroPhpCode contained contains=@phpClTop /\m\({[{%]\@!\|{{\|{%\)\(php\|var\|if\|elseif\|for\|foreach\|while\|continueIf\|breakIf\|dump\|debugbreak\)\@=.\+\(}[}%]\@!\|}}\|%}\)\@=/
syn match latteMacroPhpCode contained contains=@phpClTop,latteMacroFilter /\m\(\(|\h\w\+:\)\@=\|\$\|\(\h\w*(\)\@=\)\w.\{-1,}\(|\h\|}[}%]\@!\|}}\|%}\)\@=/
syn region latteMacroPhpCode contained contains=@phpClTop keepend start=/\m['"]/ end=/\m['"]/
syn region latteMacroTranslate matchgroup=latteOperator start=/\m\({[{%]\@!\|{{\|{%\)\/\?_/ end=/\(}[}%]\@!\|}}\|%}\)/

syn region latteNMacro matchgroup=latteOperator keepend start=/\mn:\h[A-Za-z-]*="/ end=/\m"\A/ skip=/[\[(]"/ contains=@phpClTop,latteNMacroLink,latteNMacroIdentifier
syn match latteNMacroLink contained /\m\(n:href="\)\@<=\S\+!\?/
syn match latteNMacroIdentifier contained /\m\(n:\(name\|block\|syntax\)="\)\@<=\h\S*/

syn cluster htmlPreproc add=latteMacro
syn cluster htmlArgCluster add=latteNMacro
syn cluster HtmlPreproc add=latteMacroTranslate
syn cluster htmlTop add=latteMacroTranslate

syn keyword latteTodo contained TODO FIXME XXX
syn region latteComment start=/\m{\*/ end=/\m\*}/ contains=latteTodo
syn region latteComment start=/\m{{\*/ end=/\m\*}}/ contains=latteTodo

if g:nette_deprecated
    syn cluster htmlPreproc add=latteDeprecated
    syn clear phpRegion
    syn match latteDeprecated /\m\({[{%]\?\|{{\|{%\)!.*\([%}]\)/
    if b:current_subsyntax ==# 'html'
        syn region latteDeprecated keepend start=/\m<?\(php\)\?/ end=/?>/
    endif
endif

if g:nette_deprecated >= 204
    syn match latteDeprecated /\m\({[{%]\?\|{{\|{%\)\(?\|use\|status\).*\([%}]\)/
    syn keyword latteDeprecated containedin=latteMacro includeblock
    syn keyword latteDeprecated containedin=latteMacroFilter safeurl nl2br
endif

hi def link latteOperator Operator
hi def link latteKeyword Keyword
hi def link latteConditional Conditional
hi def link latteRepeat Repeat
hi def link latteSeparator Separator
hi def link latteDebug Debug
hi def link latteMacroIdentifier Identifier
hi def link latteNMacroIdentifier Identifier
hi def link latteMacroLink String
hi def link latteNMacroLink String
hi def link latteMacroFilter Macro
hi def link latteMacroOperator Operator
hi def link latteMacroDelimiter Delimiter
hi def link latteTodo Todo
hi def link latteComment Comment
hi def link latteMacroTranslate String
hi def link latteDeprecated Error

let b:current_syntax = 'latte'
