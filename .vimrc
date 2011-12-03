call pathogen#infect()
call pathogen#helptags()

set background=dark
set ruler

" Leader
let mapleader=","

" Spacing
set tabstop=4
set shiftwidth=4

" Show things
set noshowmatch
let loaded_matchparen = 1
set showcmd

" Search Results
set incsearch " Incremental Searching

" Indentation Settings
set autoindent
set smartindent

" Line Stuff
set number " Show numbers
set textwidth=0 " Endless line width
set nowrap " No wrapping

" Format Options
set formatoptions=tcqor
set whichwrap=b,s,<,>,[,]

" Fix Terminal
set backspace=2

" Syntax Highlighting
highlight ModeMsg cterm=bold ctermfg=2 ctermbg=black	" set mode message ( --INSERT-- ) to green
highlight StatusLine ctermfg=7 ctermbg=9	" set the active statusline to black on white
highlight StatusLineNC ctermfg=8 ctermbg=9
syntax on

filetype plugin on
filetype plugin indent on

