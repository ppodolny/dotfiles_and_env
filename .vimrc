filetype indent on
color desert
syntax enable
set wildmenu 
set ai
set ic
set number
set cursorline
set wildmenu 
set lazyredraw 
set showmatch
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set paste								 " 
set showmatch                   " Show matching parenthesis.
set wrap                        " wrap lines.
set backspace=indent,eol,start  " Make backspace work as expected regardless of mode.
set ignorecase                  " Ignore case when search pattern is all lower,
set smartcase                   " but is case-sensitive if not all lower.
set hlsearch                    " Highlight search terms.
set incsearch                   " Show search matches as you type.
set wrapscan                    " Set the search scan to wrap around the file
set history=3000                " Remember more commands and search history
set undolevels=1000             " Allow more undo levels.
set visualbell                  " Don't beep!
set noerrorbells                " Don't beep!
set encoding=utf8               " UTF-8 encoding.
set nobackup                    " Let SCM deal with backups.
set nowb                        " Let SCM deal with backups.
set noswapfile                  " Let SCM deal with backups.
set expandtab                   " Tabs are spaces.
set shiftwidth=2                " Indents are 2 spaces.
set tabstop=2                   " A tab is 2 spaces.
set softtabstop=2               " Controls tab in inset mode.
set showmode                    " Display the current mode.
set ruler                       " Displays the cursor position in the buffer.
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
