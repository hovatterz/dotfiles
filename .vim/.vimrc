call pathogen#infect()
call pathogen#helptags()

" Stop myself from being stupid
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

set showtabline=2
set background=dark
set ruler

" Trying to fix TMUX weirdness
map <Esc>[B <Down>

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
set textwidth=80
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

" Switch between cpp/h files
map <Leader>f :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" Remap the tab key to do autocompletion or indentation depending on the
" context (from http://www.vim.org/tips/tip.php?tip_id=102)
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>


" CommandT ignore stuff
:set wildignore+=*.class,*.jar,*.psd,*.png,*.jpg,*.bmp,*.gif,*.jnilib,*.dylib

" RSpec
map <Leader>r :SweetVimRspecRunFile<CR>
map <Leader>R :SweetVimRspecRunFocused<CR>
map <Leader>p :SweetVimRspecRunPrevious<CR>
let $SWEET_VIM_RSPEC_SHOW_PASSING="true"
