" redirect the output of a Vim or external command into a scratch buffer
function! Redir(cmd)
    if a:cmd =~ '^!'
        execute "let output = system('" . substitute(a:cmd, '^!', '', '') . "')"
    else
        redir => output
        execute a:cmd
        redir END
    endif
    new
    setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
    call setline(1, split(output, "\n"))
    put! = a:cmd
    put = '----'
    nnoremap <buffer><silent> q :q<CR>
endfunction

function! Get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    call cursor(line_end, column_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

augroup nofile
    autocmd!
    autocmd BufEnter * if &buftype ==# "nofile" | nnoremap <buffer><silent> q :q<CR> | endif
augroup END

" command for Redir
command! -nargs=1 Redir silent call Redir(<f-args>)
