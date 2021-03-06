""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" This .vimrc is written by Jerome Wu(jeromewus@gmail.com)
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""
"vim-plug"
""""""""""
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'

Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'heavenshell/vim-jsdoc'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Tags file manager, <C-]> to jump to definition
Plug 'ludovicchabant/vim-gutentags'
" Improve HTML workflow using <C-y>, to expand
Plug 'mattn/emmet-vim'

" Show git gutter, ]c jump to next change, [c jump to prev change
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --ts-completer' }
Plug 'w0rp/ale'

call plug#end()

"""""""""
"General"
"""""""""
set nocompatible                        "enable features which are not vi compatible
filetype plugin indent on
set ls=2                                "always show status line + command-line
set autoread                            "auto read when a file is changed from outside
set viminfo^=%                          "Remember info about open buffers on close
set history=1000                        "set how many lines of history VIM has to remember

"map leader for extra key combinations
let mapleader=","
let g:mapleader=","

"auto completion and menu
set wildmode=longest:full:list
set wildmenu
set wildignore=*.o,*~,*.pyc             "ignore compiled files
set completeopt=longest,menuone


"""""""""""""
"Typesetting"
"""""""""""""
set tabstop=2                           "make a tab equal 2 space
set softtabstop=2                       "see multiple spaces as a tabstop
set shiftwidth=2                        "this allows you to use the < and > keys from VIM's visual (marking) mode to block indent/unindent regions
set expandtab                           "insert spaces instead of tab character
set autoindent                          "indent of the new line will match the previous line
set cindent                             "c indent
set backspace=indent,eol,start          "Backspace for dummies

""""""""""""""""
"User Interface"
""""""""""""""""
syntax on                               "show syntax color 
set background=dark                     "set background dark
set number relativenumber               "show line number
set title                               "show title
set cursorline                          "highlight current line
set cursorcolumn                        "highlight current column
set mouse=a                             "mouse support (for highlighting etc.), press shift when you want to copy&paste
set encoding=utf8                       "encoding
set visualbell                          "chose visual bell rather than beeping
set t_Co=256                            "Support 256 color
set splitbelow                          "make all split happen below

"search
set incsearch                           "incremental search
set hlsearch                            "highlight searching
set ignorecase                          "ignore case when searching
set smartcase                           "try to be smart about cases

"""""""""""""
"Key mapping"
"""""""""""""
",<cr> to deactive highlighting
nmap <silent> <leader><cr> :nohlsearch<cr>

"Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

",pp to toggle and untoggle paste mode on and off"
map <leader>pp :setlocal paste!<cr>

",x to view in hex mode ,xx to return
nmap <silent> <leader>x :%!xxd<cr>
nmap <silent> <leader>xx :%!xxd -r<cr>

" ,t to open a terminal
" To scroll the terminal, hit Ctrl+w N and go back with i or a
map <leader>t :term<cr>

" ,jd to insert jsDoc
nmap <leader>jd :JsDoc<cr>

" map ESC to ii
inoremap ii <ESC>

"""""""""""""""""""
"Function, autocmd"
"""""""""""""""""""
"returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE   '
  en
  return ''
endfunction

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

""""""""""""""""
"Plugin Setting"
""""""""""""""""
" A nice color theme
silent! colorscheme gruvbox

" NerdTree
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" vim-javascript
let g:javascript_plugin_flow = 1

" vim-jsx
let g:jsx_ext_required = 0

" vim-jsdoc
let g:jsdoc_enable_es6 = 1
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_access_descriptions = 1
let g:jsdoc_additional_descriptions = 1
let g:jsdoc_underscore_private = 1

" ultisnips
let g:UltiSnipsExpandTrigger="<c-o>"

" vim-gutentags
" let g:gutentags_ctags_executable = '~/bin/ctags'
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q', '--c++-kinds=+px', '--c-kinds=+px']
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" vim-gitgutter
set updatetime=100

" vim-ale
let g:ale_linters = {'javascript': ['eslint', 'flow']}                                                                                                                         
" vim-go
let g:go_version_warning = 0

" YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
