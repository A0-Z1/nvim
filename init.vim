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
" update time for CursorHold event in milliseconds
set updatetime=250
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
Plug 'neovim/nvim-lspconfig' " LSP
Plug 'ervandew/supertab' " TAB completion
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'chrisbra/csv.vim'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf.vim'
Plug 'glepnir/dashboard-nvim'
"" colorschemes
"Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
"Plug 'ayu-theme/ayu-vim' " or other package manager
"Plug 'savq/melange'
"Plug 'joshdick/onedark.vim'
"Plug 'chriskempson/base16-vim'
"Plug 'kyoz/purify', { 'rtp': 'vim' }
"Plug 'mangeshrex/uwu.vim'
Plug 'tomasr/molokai'

call plug#end()
"}}}

" Put all the plugin settings here
"{{{
" Dashboard
let g:dashboard_default_executive = "fzf"
let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]
" NetRw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
"" LSP
lua require('lspconfig').pylsp.setup{}
lua require('lspconfig').bashls.setup{}
lua require('lspconfig').r_language_server.setup{}
lua require('lspconfig').texlab.setup{}
" disable virtual text by default
lua vim.diagnostic.config({virtual_text = false})
" supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping = 1
augroup supertab
    autocmd!
    autocmd FileType tex let b:SuperTabContextTextMemberPatterns = ['\\', '{']
    autocmd FileType html let b:SuperTabContextTextMemberPatterns = ['</', '<']
    autocmd FileType python let b:SuperTabContextTextMemberPatterns = ['\.', '@']
    autocmd FileType sh let b:SuperTabContextTextMemberPatterns = ['\$', '(']
    autocmd FileType r let b:SuperTabContextTextMemberPatterns = ['\.', '\$', ':']
augroup END
" vimwiki
let g:vimwiki_list = [{'path': '~/Wikis/Personal',
      \ 'path_html': '~/Wikis/Personal/html/',
      \ 'template_path': '~/Wikis/templates/',
      \ 'template_ext': '.html',
      \ 'template_default': 'default'},
      \ {'path': '~/Wikis/Machine\ Learning',
      \ 'path_html': '~/Wikis/Machine\ Learning/html/',
      \ 'template_path': '~/Wikis/templates/',
      \ 'template_ext': '.html',
      \ 'template_default': 'default'},
      \ {'path': '~/Wikis/Coding',
      \ 'path_html': '~/Wikis/Coding/html/',
      \ 'template_path': '~/Wikis/templates/',
      \ 'template_ext': '.html',
      \ 'template_default': 'default'},
      \ {'path': '~/Wikis/Work',
      \ 'path_html': '~/Wikis/Work/html/',
      \ 'template_path': '~/Wikis/templates/',
      \ 'template_ext': '.html',
      \ 'template_default': 'default'}]
" tokyonight
"let tokyonight_style = "night"
"let tokyonight_style = "storm"
"let tokyonight_style = "light"
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
"}}}

" Put all the highlight settings here
"{{{
" launch colorscheme
colorscheme molokai
" enable transparency with colorscheme
"hi Normal guibg=NONE
" set cursorline
"hi cursorline gui=none guifg=none guibg=grey25
" set cursorcolumn
"hi cursorcolumn gui=none guifg=none guibg=grey40
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
"nnoremap <silent> <leader>b :ls<CR>:buffer<SPACE>
" (using fzf)
nnoremap <silent> <leader>b :Buffers<CR>
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
nnoremap <silent> <leader>m :make %<CR>
" Project drawer
nnoremap <silent> <F2> :Lexplore<CR>
" change directory to local file
nnoremap <silent> <leader>cd :echom "Changing directory to ".expand("%:h")<CR>:cd %:h<CR>
"" commands
" Display infos about current file
command! Infos echo "Informations about file "."'".expand("%:t")."'"."\nFile Type:\t".toupper(&filetype)."\nFile Encoding:\t".toupper(&fenc)."\nFile Format:\t".toupper(&ff)

nnoremap <silent> <leader>f :Files<CR>
command! Myscripts :Files /home/ld/.scripts

"" mappings for dashboard.nvim
" nmap <Leader>ss :<C-u>SessionSave<CR>
" nmap <Leader>sl :<C-u>SessionLoad<CR>
" nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
" nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
" nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
" nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
" nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
" nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
"}}}
