"""  _ __   ___  _____   _(_)_ __ ___  
""" | '_ \ / _ \/ _ \ \ / / | '_ ` _ \ 
""" | | | |  __/ (_) \ V /| | | | | | |
""" |_| |_|\___|\___/ \_/ |_|_| |_| |_|


" Put all the nvim options here
"{{{
set showmode " Enable showmode (show current mode in command line)
set number relativenumber " Enable row numbers
set cursorline " Enable cursorline
set hlsearch " Highlight searches
set ignorecase smartcase " Do case insensitive searches
set incsearch " Show incremental search results as you type
set autoindent expandtab tabstop=4 shiftwidth=4 " Enable autoindent
set splitbelow splitright " Regulate positions of new windows
set hidden " To leave buffers that have changes
set confirm
set tgc " Enable 24bit colors in TUI
set undofile " Save undo trees in files
set undodir=~/.local/share/nvim/undo " undo directory
set undolevels=10000 " Number of undo saved
set completeopt=menuone " specify how popup menu works
" Set grep engine with the Perl -P option
let &grepprg="grep -nP $* /dev/null"
" Set the make command
let &makeprg="autocompile $*"
" settings specific to neovim
set nocompatible
" set mouse
set mouse=a
set omnifunc=syntaxcomplete#Complete
filetype plugin on
syntax on
"" don't implement dbext stupid keybindings
"let g:omni_sql_no_default_maps = 1
"}}}

" Put all the user-defined variables here
" {{{
" Make every .tex file become filetype latex
let g:tex_flavor="latex"
" enable python for virtualenvs
let g:python3_host_prog = '~/.venv/neovim/bin/python'
" }}}

" Put all the plugins here
"{{{
call plug#begin('~/.local.share/nvim/plugged')

Plug 'tpope/vim-surround' " easy bracket managing
Plug 'tpope/vim-fugitive' " Add integration with Git
"Plug 'neovim/nvim-lspconfig' " LSP
Plug 'ervandew/supertab' " TAB completion
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()
"}}}

" Put all the plugin settings here
"{{{
" NetRw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
"" LSP
"lua require('lspconfig').pylsp.setup{}
"lua require('lspconfig').r_language_server.setup{}
"lua require('lspconfig').texlab.setup{}
" supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping = 1
augroup supertab
    autocmd!
    autocmd FileType tex let b:SuperTabContextTextMemberPatterns = ['\\', '{']
    autocmd FileType html let b:SuperTabContextTextMemberPatterns = ['</', '<']
    autocmd FileType python let b:SuperTabContextTextMemberPatterns = ['\.', '@']
augroup END
" terminal remappings
nmap <silent> <F4> <Plug>CreateDynamicCons
nmap <silent> <F5> <Plug>CreateDynamicTerm
nmap <silent> <F6> <Plug>CreateDynamicDebugger
nmap <silent> <F7> <Plug>ToggleTerminal
tmap <silent> <F7> <C-\><C-n><Plug>ToggleTerminal
nmap <silent> <F9> <Plug>KillTerminal
tmap <silent> <F9> <C-\><C-n><Plug>KillTerminal
augroup terminal_remap
    autocmd!
    " close terminal window (but not process)
    autocmd TermOpen,BufEnter * if &buftype ==# "terminal" | nnoremap <buffer><silent> <A-q> :q<CR> | endif
    autocmd TermOpen,BufEnter * if &buftype ==# "terminal" | tnoremap <buffer><silent> <A-q> <C-\><C-n>:q<CR> | endif
augroup END
" nnn remapping
nmap <silent> <F3> <Plug>NNNChoose_file
"}}}

" Put all the highlight settings here
"{{{
" launch colorscheme
colorscheme dracula
" enable transparency with colorscheme
"hi Normal guibg=NONE
" set cursorline
hi cursorline gui=none guifg=none guibg=grey25
" set cursorcolumn
hi cursorcolumn gui=none guifg=none guibg=grey40
" set floating window border color
hi FloatBorder guifg=#d79921
" set error message
hi Error guifg=red
"}}}

" Put all the global mappings and commands here
"{{{
let mapleader = ","
let maplocalleader ="\\"

" copy to clipboard
vnoremap <silent> <C-c> "+y
nnoremap <silent> <C-p> "+p
" copy to the end of line
nnoremap <silent> Y y$
" View the current buffers
nnoremap <silent> <leader>b :ls<CR>:buffer<SPACE>
" Switch to prev/next buffer
nnoremap <silent> <leader>n :bnext<CR>
nnoremap <silent> <leader>N :bprevious<CR>
" Remap to go to middle of text line
nnoremap <silent> gm :call cursor(0, virtcol('$')/2)<CR>
" cursorcolumn
nnoremap <silent> <leader>cc :set cursorcolumn!<CR>
" Go quickly to init.vim
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>
" Go quickly to ginit.vim
nnoremap <silent> <leader>eg :vsplit ~/.config/nvim/ginit.vim<CR>
" Source init.vim
nnoremap <silent> <leader>sv :source $MYVIMRC<CR>
" jump to alternate buffer (also CTRL_^)
nnoremap <silent> <SPACE> <C-^>
" Remap window movements
nnoremap <silent> <A-h> <C-w>h
nnoremap <silent> <A-j> <C-w>j
nnoremap <silent> <A-k> <C-w>k
nnoremap <silent> <A-l> <C-w>l
inoremap <silent> <A-h> <ESC><C-w>h
inoremap <silent> <A-j> <ESC><C-w>j
inoremap <silent> <A-k> <ESC><C-w>k
inoremap <silent> <A-l> <ESC><C-w>l
tnoremap <silent> <A-h> <C-\><C-n><C-w>h
tnoremap <silent> <A-j> <C-\><C-n><C-w>j
tnoremap <silent> <A-k> <C-\><C-n><C-w>k
tnoremap <silent> <A-l> <C-\><C-n><C-w>l
" Remap window resizing
nnoremap <silent> <Up>      :resize +2<CR>
nnoremap <silent> <Down>    :resize -2<CR>
nnoremap <silent> <Right>   :vertical resize +2<CR>
nnoremap <silent> <Left>    :vertical resize -2<CR>
" Stop highlighting from last search
nnoremap <silent> <ESC> <ESC>:nohlsearch<CR>:echo ""<CR>
" Delete trailing whitespaces
nnoremap <silent> <leader>wd :%s#\v\s+$##g<CR>:nohlsearch<CR>
" Toggle spelling check
nnoremap <silent> <leader>i :setlocal spell! spelllang=en_gb<CR>
nnoremap <silent> <leader>I :setlocal spell spelllang=it<CR>
" remap quickfix commands
nnoremap <silent> <leader>qo :copen<CR>
nnoremap <silent> <leader>qq :cclose<CR>
nnoremap <silent> <leader>qn :cnext<CR>
nnoremap <silent> <leader>qp :cprev<CR>
nnoremap <silent> <leader>qf :cfirst<CR>
nnoremap <silent> <leader>ql :clast<CR>
" compile
nnoremap <silent> <localleader>c :make %<CR>
" Project drawer
nnoremap <silent> <F2> :Lexplore<CR>
" change directory to local file
nnoremap <silent> <leader>cd :echom "Changing directory to ".expand("%:h")<CR>:cd %:h<CR>
"" commands
" Display infos about current file
command! Infos echo "Informations about file "."'".expand("%:t")."'"."\nFile Type:\t".toupper(&filetype)."\nFile Encoding:\t".toupper(&fenc)."\nFile Format:\t".toupper(&ff)
"}}}

"" Welcome message
"execute "echo 'Welcome back. Today is' strftime(\"%A %d %B %Y\")"
