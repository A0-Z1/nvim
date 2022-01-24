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
set listchars=eol:↴,lead:⋅,tab:<->
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
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'chrisbra/csv.vim'
Plug 'vimwiki/vimwiki', {'branch': 'dev'}
Plug 'junegunn/fzf.vim'
Plug 'tomasr/molokai'
Plug 'glepnir/dashboard-nvim'
Plug 'folke/zen-mode.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'ervandew/supertab'

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
lua require('lspconfig').pylsp.setup{}
lua require('lspconfig').bashls.setup{}
lua require('lspconfig').r_language_server.setup{}
lua require('lspconfig').texlab.setup{}
" disable virtual text by default
lua vim.diagnostic.config({virtual_text = false})
" supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
"let g:SuperTabCrMapping = 1
let g:SuperTabRetainCompletionDuration = 'completion'
augroup supertab
    autocmd!
    autocmd FileType tex let b:SuperTabContextTextMemberPatterns = ['\\', '{']
    autocmd FileType html,css,javascript let b:SuperTabContextTextMemberPatterns = ['</', '<']
    autocmd FileType python let b:SuperTabContextTextMemberPatterns = ['\.', '@']
    autocmd FileType sh,bash let b:SuperTabContextTextMemberPatterns = ['\$', '(']
    autocmd FileType r,rmd let b:SuperTabContextTextMemberPatterns = ['\.', '\$', ':']
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
let g:vimwiki_key_mappings = {
      \ 'table_mappings': 0
      \}
" Vim Dashboard
" Default value is clap
let g:dashboard_default_executive ='fzf'
"Custom shortcuts
let g:dashboard_custom_shortcut={
\ 'last_session'       : '<leader>sl',
\ 'find_history'       : '<leader>fh',
\ 'find_file'          : '<leader>ff',
\ 'new_file'           : '<leader>cn',
\ 'change_colorscheme' : '<leader>fc',
\ 'find_word'          : '<leader>fw',
\ 'book_marks'         : '<leader>fb',
\ }
" header
let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]
let g:dashboard_custom_section={
            \ 'book_marks': {
                \ 'description': [' Jump to bookmarks                 <leader>fm'],
                \ 'command': 'DashboardJumpMark' },
            \ 'find_file': {
                \ 'description': [' Find File                         <leader>ff'],
                \ 'command': 'DashboardFindFile' },
            \ 'new_file': {
                \ 'description': [' New File                          <leader>cn'],
                \ 'command': 'DashboardNewFile' },
            \ 'init': {
                \ 'description': [' Jump to init                      <leader>ev'],
                \ 'command': 'edit $MYVIMRC' },
            \ 'last_session': {
                \ 'description': [' Last Session                      <leader>sl'],
                \ 'command': 'SessionLoad' },
            \ 'find_history': {
                \ 'description': ['ﭯ Recently opened files             <leader>fh'],
                \ 'command': 'DashboardFindHistory' },
            \ 'open_browser': {
                \ 'description': [' Open File Browser                 <leader>, '],
                \ 'command': 'NNN' },
            \ 'select_wiki': {
                \ 'description': [' Select Wiki                       <leader>ws'],
                \ 'command': 'VimwikiUISelect' },
            \ 'go_to_scripts': {
                \ 'description': ['亮Jump to my scripts                <leader>fs'],
                \ 'command': 'Files /home/ld/.scripts' },
  \ }

" ZenMode config
lua << EOF
  require("zen-mode").setup {
    window = {
        backdrop = 0.90, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        -- height and width can be:
        -- * an absolute number of cells when > 1
        -- * a percentage of the width / height of the editor when <= 1
        -- * a function that returns the width or the height
        width = 120, -- width of the Zen window
        height = 1, -- height of the Zen window
        -- by default, no options are changed for the Zen window
        -- uncomment any of the options below, or add other vim.wo options you want to apply
        options = {
          -- signcolumn = "no", -- disable signcolumn
          -- number = false, -- disable number column
          -- relativenumber = false, -- disable relative numbers
          -- cursorline = false, -- disable cursorline
          -- cursorcolumn = false, -- disable cursor column
          -- foldcolumn = "0", -- disable fold column
          -- list = false, -- disable whitespace characters
        }
    }
  }
EOF

" indent line filetypes
let g:indent_blankline_filetype = ['python', 'r', 'sh', 'bash', 'vim', 'lua', 'rust', 'c', 'html', 'css', 'javascript']
let g:indent_blankline_show_end_of_line = v:true
let g:indent_blankline_max_indent_increase = 1
"let g:indent_blankline_show_first_indent_level = v:false
"}}}

" Put all the highlight settings here
"{{{
" launch colorscheme
colorscheme molokai
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
" exit from completion without modifying the word with ESC
inoremap <expr> <ESC> pumvisible() ? "\<C-e>" : "\<Esc>"
" confirm completion with CR
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
"" commands
" Display infos about current file
command! Infos echo "Informations about file "."'".expand("%:t")."'"."\nFile Type:\t".toupper(&filetype)."\nFile Encoding:\t".toupper(&fenc)."\nFile Format:\t".toupper(&ff)

" display space char
"nnoremap <silent> <leader>ll :set list!<CR>
" FZF remappings
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fm :Marks<CR>
nnoremap <silent> <leader>fh :History<CR>
nnoremap <silent> <leader>fw :Rg<CR>
nnoremap <silent> <leader>fc :Colors<CR>
nnoremap <silent> <leader>fs :Files ~/.scripts<CR>
nnoremap <silent> <leader>b :Buffers<CR>

" Vim Dashboard remapping
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
" save session
"nnoremap <silent> <leader>ss :mksession! /home/ld/.cache/vim/session/default.vim<CR>:echo "Session saved"<CR>
"nnoremap <silent> <leader>ll :source /home/ld/.cache/vim/session/default.vim<CR>:echo "Session restored"<CR>
" Zen Mode
nnoremap <silent><leader>zz :ZenMode<CR>
"}}}
