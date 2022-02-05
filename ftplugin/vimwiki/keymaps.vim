nnoremap <buffer><silent> <leader>wH :VimwikiAll2HTML<CR>
nnoremap <buffer><silent> <leader>wC :VimwikiTOC<CR>
imap <buffer><silent> <C-TAB> <Plug>VimwikiTableNextCell
imap <buffer><silent> <C-S-TAB> <Plug>VimwikiTablePrevCell
inoremap <buffer><expr> <CR> pumvisible() ? "\<C-y>" : "\<C-]>\<Esc>:VimwikiReturn 1 5\<CR>"
setlocal spell! spelllang=en_gb
