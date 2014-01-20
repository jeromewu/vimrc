""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"this .vimrc is written by Jerome Wu(jeromewus@gmail.com)
"feel free to modify :)
"
"the goal of this vimrc is to keep it simple and you don't
"need to install any plugins.
"
"
"ref:
"http://amix.dk/vim/vimrc.html
"http://vim.spf13.com
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""
"General"
"""""""""
set nocompatible                        "enable features which are not vi compatible
set ls=2                                "always show status line + command-line
set autoread                            "auto read when a file is changed from outside
filetype plugin indent on               "automatically detect file types
set viminfo^=%                          " Remember info about open buffers on close
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
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
set showmode                            "display current mode


"search
set incsearch                           "incremental search
set hlsearch                            "highlight searching
set ignorecase                          "ignore case when searching
set smartcase                           "try to be smart about cases

"""""""""""""
"Key mapping"
"""""""""""""
",n to deactive highlighting
nmap <silent> <leader>n :silent :nohlsearch<CR>
",x to view in hex mode ,xx to return
nmap <silent> <leader>x :%!xxd<CR>
nmap <silent> <leader>xx :%!xxd -r<CR>
",r to execute current file(for python and bash script)
nmap <silent> <leader>r :!./%<CR>


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
