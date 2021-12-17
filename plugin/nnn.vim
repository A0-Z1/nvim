""" functions
"{{{
function! s:Set_options()
    " get the current UI settings
    let ui = nvim_list_uis()[0]
    " determine width and height
    let width = float2nr(ui.width*0.7)
    let height = float2nr(ui.height*0.6)
    " Create the floating window
    let opts = {'relative': 'editor',
                \ 'width': width,
                \ 'height': height,
                \ 'anchor': 'NW',
                \ 'col': (ui.width/2) - (width/2),
                \ 'row': (ui.height/2) - (height/2),
                \ 'style': 'minimal',
                \ 'border': 'rounded',
                \ }
    return opts
endfunction

function! s:NNNChooser_float()
    let l:temp = tempname()
    " save the previous buffer
    let l:prev = winnr()
    " launch nnn
    let name = 'term://nnn -p ' . shellescape(l:temp)
    execute "badd ".name
    " nnn buffer
    let l:buf = bufnr(name)
    " set name of temp file local to nnn buffer
    call nvim_buf_set_var(l:buf, 'temp', l:temp)
    let opts = <SID>Set_options()
    call nvim_open_win(buf, 1, opts)
    setlocal nobuflisted
    let b:nnn = bufnr()
    let b:prev = l:prev
endfunction

function! s:NNNChooser()
    let l:temp = tempname()
    " launch nnn
    call termopen('nnn -p ' . shellescape(l:temp))
    let b:temp = l:temp
    " characterize this buffer as nnn
    let b:nnn = bufnr()
    let b:prev = winnr()
endfunction

function! s:NNNChoose(float=1)
    if a:float
        call <SID>NNNChooser_float()
    else
        call <SID>NNNChooser()
    endif
endfunction

" open the files selected
function! s:Opener(storage)
    let l:nnn = b:nnn
    let l:buf = b:prev
    " delete terminal buffer
    if !filereadable(a:storage)
        redraw!
        " Nothing to read.
        return
    endif

    let names = readfile(a:storage)

    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec l:buf.' wincmd w'
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
    " wipeout terminal buffer
    exec "bw! ".l:nnn
endfunction
"}}}

""" autocommdands
"{{{
augroup nnn
    autocmd!

    " every time a terminal buffer is closed, check
    " if it was a nnn instance. If it was, then open
    " the files
    autocmd TermClose * if exists('b:nnn') | call <SID>Opener(b:temp) | filetype detect | endif
    " if the file selected is a directory, start in nnn
    autocmd VimEnter * if isdirectory(expand("%")) | call <SID>NNNChooser() | execute 'startinsert' | endif

augroup END
"}}}

""" commands and remaps
"{{{
command! -nargs=? NNN silent call <SID>NNNChoose(<f-args>)
nmap <silent> <localleader>f <Plug>NNNChoose_file
nnoremap <Plug>NNNChoose_file :NNN<CR>
"}}}
