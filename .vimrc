""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"this .vimrc is written by Jerome Wu(jeromewus@gmail.com)
"feel free to modify :)
"
"ref:
"http://amix.dk/vim/vimrc.html
"http://vim.spf13.com
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""
"Pathogen"
""""""""
execute pathogen#infect()

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
set number                              "show line number
set title                               "show title
set cursorline                          "highlight current line
set cursorcolumn                        "highlight current column
set mouse=a                             "mouse support (for highlighting etc.), press shift when you want to copy&paste
set encoding=utf8                       "encoding
set visualbell                          "chose visual bell rather than beeping
set ruler                               "show current position
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) "a ruler on steroids 
set laststatus=2                        "always show the status line
set statusline=\ %{HasPaste()}\ %<%F\ \ \ [%M%R%H%W%Y][%{&ff}]\ \ %=\ line:%l/%L\ col:%c\ \ \ %p%%\ \ \ @%{strftime(\"%H:%M:%S\")}
set showmode                            "display current mode
set t_Co=256                            "Support 256 color


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
" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null
"Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk
",pp to toggle and untoggle paste mode on and off"
map <leader>pp :setlocal paste!<cr>
",x to view in hex mode ,xx to return
nmap <silent> <leader>x :%!xxd<cr>
nmap <silent> <leader>xx :%!xxd -r<cr>

" ,sc to view the syntastic check result
map <leader>sc :SyntasticCheck<cr>

" remap ESC to jj
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
color jellybeans

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

" default settings syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" vim-jsx
let g:jsx_ext_required = 0
