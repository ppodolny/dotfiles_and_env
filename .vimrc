set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

Plugin 'tmhedberg/SimpylFold'

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix


Plugin 'vim-scripts/indentpython.vim'
" Bundle 'Valloric/YouCompleteMe'
" let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'

let python_highlight_all=1
syntax on
Plugin 'tpope/vim-fugitive'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

filetype indent on
color desert
syntax enable
set wildmenu 
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
set showmode                    " Display the current mode.
set ruler                       " Displays the cursor position in the buffer.
set laststatus=2
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
