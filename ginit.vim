" Enable Mouse
set mouse=a
" show filename in title
set title


" Set Editor Font
if exists(':GuiFont')
    " Use GuiFont! to ignore font errors
    GuiFont Hack Nerd Font:h11
endif

"" Disable GUI Tabline
"if exists(':GuiTabline')
"    GuiTabline 0
"endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 1
endif

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv


" send lines to terminal (only valid in gvim apparently)
nmap <silent> <C-ENTER> <Plug>SendLine
imap <silent> <C-ENTER> <C-o><Plug>SendLine
vmap <silent> <C-ENTER> <Plug>SendSelection
