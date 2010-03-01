""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible               " Vi mode is the devil
set history=50                 " lines of CLI history to remember
set sidescroll=1               " scroll by one character horizontally
filetype on                    " detect file type
filetype plugin on             " load filetype plugins
filetype plugin indent on      " load indent rules based on filetype
set backspace=indent,eol,start " backspace over everything in insert mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Theme/Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=light
syntax on
colorscheme default
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vim UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler         " always show cursor position
set showcmd       " show partially completed commands
set showmode      " always show mode
set guioptions-=T " no more toolbar in GVim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Visual Cues
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch " show matching brackets
set listchars+=precedes:<,extends:> " change more text characters
set incsearch                       " incremental search
set nohlsearch                      " don't highlight search matches
set ignorecase                      " case-insensitive searches
set smartcase                       " case-sensitive if there are capitals
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Text/Layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set nowrap
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Folding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable        " enable folding
set foldmethod=indent " make folding indend sensitive
set foldlevel=100     " don't autofold
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Local Changes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vimrc.local
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Language Specific
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let python_highlight_numbers=1
let python_hilight_builtins=1
let python_hilight_exceptions=1
