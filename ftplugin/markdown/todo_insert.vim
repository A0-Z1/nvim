" highlight group
" {{{
" set error message
hi Error guibg=red
" }}}

" functions
" {{{
"" repeat TODO checklist item on newline
"function s:RepeatCheck(cmd)
"    if getline(".") =~ '^ *\* \[ \]' || getline(".") =~ '^ *\* \[X\]'
"        exec "normal! ".a:cmd."\r* [ ] "
"        startinsert!
"    elseif getline(".") =~ '^ *\* '
"        exec "normal! ".a:cmd."\r* "
"        startinsert!
"    elseif getline(".") =~ '^ *1\. \[ \]' || getline(".") =~ '^ *1\. \[X\]'
"        exec "normal! ".a:cmd."\r1. [ ] "
"        startinsert!
"    elseif getline(".") =~ '^ *1\.'
"        exec "normal! ".a:cmd."\r1. "
"        startinsert!
"    else
"        exec "normal! ".a:cmd
"        startinsert!
"    endif
"endfunction

" toggle TODO
function! s:ToggleChecks()
    let save_cursor = getcurpos()
    let lines = getline(".")
    if lines =~ '\[ \]'
        substitute/\[ \]/\[X\]/
    elseif lines =~ '\[X\]'
        substitute/\[X\]/\[ \]/
    else
        echohl Error | echom "Not on a TODO entry!" | echohl None
    endif
    call setpos(".", save_cursor)
endfunction

" go to next empty checkbox
function! s:NextCheck()
    normal! 0
    let line_nr = search('^\s*\* \[ \]')
    if line_nr != 0
        call cursor(line_nr, 1)
    else
        normal! j
    endif
endfunction

function! s:PrevCheck()
    normal! 0
    let line_nr = search('^\s*\* \[ \]', 'b')
    if line_nr != 0
        call cursor(line_nr, 1)
    else
        normal! k
    endif
endfunction
" }}}

" mappings
" {{{
"nmap <buffer><silent> o <Plug>RepeatCheckList_o
"imap <buffer><silent> <CR> <ESC><Plug>RepeatCheckList_CR
nmap <buffer><silent> <localleader><SPACE> <Plug>CheckItem
nmap <buffer><silent> <localleader>j <Plug>NextCheckItem
nmap <buffer><silent> <localleader>k <Plug>PrevCheckItem

"nnoremap <buffer><silent> <Plug>RepeatCheckList_o :call <SID>RepeatCheck("o")<CR>
"nnoremap <buffer><silent> <Plug>RepeatCheckList_CR :call <SID>RepeatCheck("a\r")<CR>
nnoremap <buffer><silent> <Plug>CheckItem :call <SID>ToggleChecks()<CR>
nnoremap <buffer><silent> <Plug>NextCheckItem :call <SID>NextCheck()<CR>
nnoremap <buffer><silent> <Plug>PrevCheckItem :call <SID>PrevCheck()<CR>
" }}}
