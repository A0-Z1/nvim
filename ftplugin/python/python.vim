"" Python
compiler pyunit
" Set folding in Python files
setlocal foldmethod=indent foldlevel=50
" set dictionary for autocompletion
setlocal dictionary=/home/ld/.config/nvim/words/python/complete-dict
" terminal commands
nnoremap <buffer><silent> <localleader>h :call Redir("!pydoc ".expand("<cword>"))<CR>
vnoremap <buffer><silent> <localleader>h :<C-U>call Redir("!pydoc ".Get_visual_selection())<CR>
nnoremap <buffer><silent> <localleader>pp :call SendCmd('print('.expand("<cword>").')'."\n")<CR>
vnoremap <buffer><silent> <localleader>pp :call SendCmd('print('.Get_visual_selection().')'."\n")<CR>

command! Notebook !/home/ld/.venv/neovim/bin/jupytext --update --to notebook %
nnoremap <buffer><silent> <localleader>jn :Notebook<CR>

nnoremap <silent><buffer> <C-down> :call NextChunk()<CR>
nnoremap <silent><buffer> <C-up> :call PrevChunk()<CR>
