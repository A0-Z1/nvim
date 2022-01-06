""" R commands and properties
" lookup program
"setlocal keywordprg=Rdoc
setlocal nowrap
" only with Nvim-R
let R_rconsole_width = 54
let R_min_editor_width = 18
" for GUI instance
if exists('g:GtkGuiLoaded')
    vmap <buffer><silent> <C-ENTER> <Plug>RDSendSelection
    nmap <buffer><silent> <C-ENTER> <Plug>RDSendLine
    imap <buffer><silent> <C-ENTER> <C-o><Plug>RSendLine
    let R_assign_map = '<M-->'
endif                                                 
" LSP
"setlocal omnifunc=v:lua.vim.lsp.omnifunc
"" terminal commands
"nnoremap <buffer><silent> <localleader>ss :call SendCmd("save.image(\".RData\")\n")<CR>
"nnoremap <buffer><silent> <localleader>aa :call SendCmd('source("'.expand("%").'")'."\n")<CR>
"nnoremap <buffer><silent> <localleader>rr :call SendCmd('system("clear")'."\n")<CR>
"nnoremap <buffer><silent> <localleader>rm :call SendCmd('rm(list=ls())'."\n")<CR>
"nnoremap <buffer><silent> <localleader>rt :call SendCmd('rm('.expand("<cword>").')'."\n")<CR>
"nnoremap <buffer><silent> <localleader>ls :call SendCmd('ls()'."\n")<CR>
"nnoremap <buffer><silent> <localleader>pp :call SendCmd('print('.expand("<cword>").')'."\n")<CR>
"vnoremap <buffer><silent> <localleader>pp :call SendCmd('print('.Get_visual_selection().')'."\n")<CR>
"nnoremap <buffer><silent> <localleader>h :call Redir("!Rdoc ".expand("<cword>"))<CR>
"vnoremap <buffer><silent> <localleader>h :<C-U>call Redir("!Rdoc ".Get_visual_selection())<CR>
"nnoremap <buffer><silent> <localleader>e :call Redir('!Rscript -e "example(\"'.expand("<cword>").'\")"')<CR>
"inoremap <buffer><silent> <a--> <C-r>=' <- '<CR>
