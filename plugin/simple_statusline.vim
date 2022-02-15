hi User1 gui=bold,reverse guifg=#455354 guibg=#fd971f
hi User2 gui=bold,reverse guifg=#455354 guibg=#A6e22e
hi User3 gui=italic,reverse guifg=#455354 guibg=#7E8E91
hi User4 gui=bold,reverse guifg=#455354 guibg=#ae81ff

" Display Git branching
function! Branches()
    let branch = FugitiveStatusline()
    if branch ==# ""
        let status  = ""
    else
        let status = "   ".branch[5:-3]."  "
    endif

    return status
endfunction

" This function checks if spell is active,
" and show it on the statusline
function! Spelling()
    if &spell
        let status = "(".&spelllang.") "
    else
        let status = ""
    endif

    return status
endfunction

function! TreeSitter()
    let scope = nvim_treesitter#statusline()
    if scope ==# "" || scope ==# "null"
        let status = ""
    else
        let status = " " . scope . "   "
    endif

    return status
endfunction

function! CurDir()
    return b:netrw_curdir
endfunction

" for netrw
augroup netrw
    autocmd!
    autocmd BufAdd * if &filetype ==# "netrw" | let &l:statusline=" %{CurDir()} %r%m" | endif
augroup END


set statusline=%t\%h%m%r%3*%{Spelling()}%*%1*%{Branches()}%*%=%<%2*%{TreeSitter()}%*%-14.(%l,%c%V%)\ %P
