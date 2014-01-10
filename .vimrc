call pathogen#infect()
call pathogen#helptags()

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
    set guifont=Inconsolata-dz:h14
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END
else
  set autoindent        " always set autoindenting on
endif " has("autocmd")

" GRB: sane editing configuration"
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set laststatus=2
set showmatch
set incsearch

" GRB: highlighting search"
set hls

" GRB: set the color scheme
:set t_Co=256 " 256 colors

" GRB: Put useful info in status line
:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
:hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red

" GRB: clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

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
:set complete-=i

let mapleader=","
set cursorline
set cmdheight=1

" Don't show scroll bars in the GUI
set guioptions-=L
set guioptions-=r

augroup myfiletypes
    " Clear old autocmds in group
    autocmd!

    " For Ruby, autoindent with two spaces, always expand tabs
    autocmd FileType ruby,haml,eruby,yaml,sass,cucumber set ai sw=2 sts=2 et
    autocmd FileType html,javascript set ai sw=4 sts=4 et
augroup END

set switchbuf=useopen

set number
set numberwidth=5

" Seriously, guys. It's not like :W is bound to anything anyway.
:map W :w<cr>

:map <Leader>n :%s/\r/\r/g<cr>

" Always show tab bar
set showtabline=2

augroup mkd
    autocmd BufRead *.mkd set textwidth=75 ai formatoptions=tcroqn2 comments=n:&gt;
    autocmd BufRead *.markdown set textwidth=75 ai formatoptions=tcroqn2 comments=n:&gt;
augroup END

set shell=bash

" Indent p tags
autocmd FileType html,eruby if g:html_indent_tags !~ '\\|p\>' | let g:html_indent_tags .= '\|p\|li\|dt\|dd' | endif

autocmd FileType javascript set shiftwidth=2

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

function! GFTabEdit()
    let file=expand("<cfile>")
    exec "tabnew"
    exec "edit " . file
endfunction

:map gf :call GFTabEdit()<CR>
set wildignore+=doc/*
set wildignore+=docs/*

let g:localvimrc_sandbox=0

if filereadable("Makefile")
    set wildignore+=build/*,obj/*
    nmap <Leader>r :make run<CR>
    nmap <Leader>m :make<CR>
elseif filereadable("CMakeLists.txt")
    set wildignore+=build/*,obj/*
    set makeprg=make\ -C\ build/
    nmap <Leader>m :make<CR>
elseif filereadable("SConstruct")
    set wildignore+=build/*
    set makeprg=scons
    nmap <Leader>m :make<CR>
elseif filereadable("Gruntfile.js")
    set wildignore+=node_modules
    set makeprg=grunt
    nmap <Leader>m :make<CR>
end

if filereadable("Gemfile")
    nmap <Leader>r :Rake<CR>
end

" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
    try
        silent let selection = system(a:choice_command . " | selecta " . a:selecta_args)
    catch /Vim:Interrupt/
        " Swallow the ^C so that the redraw below happens; otherwise there will be
        " leftovers from selecta on the screen
    endtry
    exec a:vim_command . " " . selection
    redraw!
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>f :call SelectaCommand("find * -type f", "", ":e")<cr>

" folding settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Don't indent namespace and template
function! CppNoNamespaceAndTemplateIndent()
    let l:cline_num = line('.')
    let l:cline = getline(l:cline_num)
    let l:pline_num = prevnonblank(l:cline_num - 1)
    let l:pline = getline(l:pline_num)
    while l:pline =~# '\(^\s*{\s*\|^\s*//\|^\s*/\*\|\*/\s*$\)'
        let l:pline_num = prevnonblank(l:pline_num - 1)
        let l:pline = getline(l:pline_num)
    endwhile
    let l:retv = cindent('.')
    let l:pindent = indent(l:pline_num)
    if l:pline =~# '^\s*template\s*\s*$'
        let l:retv = l:pindent
    elseif l:pline =~# '\s*typename\s*.*,\s*$'
        let l:retv = l:pindent
    elseif l:cline =~# '^\s*>\s*$'
        let l:retv = l:pindent - &shiftwidth
    elseif l:pline =~# '\s*typename\s*.*>\s*$'
        let l:retv = l:pindent - &shiftwidth
    elseif l:pline =~# '^\s*namespace.*'
        let l:retv = 0
    endif
    return l:retv
endfunction

if has("autocmd")
    autocmd BufEnter *.{cc,cxx,cpp,h,hh,hpp,hxx} setlocal indentexpr=CppNoNamespaceAndTemplateIndent()
endif

set background=dark
colorscheme tomorrow-night

" Display bad trailing spaces, nbsps, and tabs
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list
