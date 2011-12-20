call pathogen#infect()
call pathogen#helptags()

set background=dark
set ruler

" Trying to fix TMUX weirdness
map <Esc>[B <Down>

" Leader
let mapleader=","

" Clipboard
set clipboard=unnamed

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
set textwidth=80
set wrap
set showbreak=>>>

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

" Rspec
map <Leader>T :! rspec spec/


