" vim behavior "

" plugin manager
execute pathogen#infect()

" disable vi compatibility
set nocompatible
" allow to change buffers without saving them
set hidden
" enable inline ft settings
set modeline

" http://weevilgenius.net/2010/10/vim-tip-relocating-vim-swapfiles/
set dir^=~/.vim/swp//

" enable syntax highlight
syntax on
" enable filetype-specific features
filetype plugin indent on
" file extensions not recognized by default
au BufNewFile,BufRead *.jbuilder set filetype=ruby
au BufNewFile,BufRead *.dump set filetype=sql
au BufNewFile,BufRead *.vue set filetype=javascript
au BufNewFile,BufRead *.slim set filetype=haml

" configure vim's path from env vars
let &path = &path . "," . substitute($VIMPATH, ':', ',', 'g')

" autofold
set foldmethod=indent
" expand folds when opening files
au BufRead * normal zR
" extras for vim-latexsuite
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

" disable mouse by default
set mouse=
" enable/disable mouse support
nnoremap <silent> <Leader>m :silent set mouse=a<CR>:set mouse?<CR>
nnoremap <silent> <Leader>M :silent set mouse=<CR>:set mouse?<CR>
" shortcut to check for external modifications
nnoremap <silent> <Leader><CR> :checktime<CR>


" avoid messing with the screen
set nowrap
" switch line wrap
nnoremap <silent> <Leader>w :silent set wrap!<CR>:set wrap?<CR>
" highlight expected code width
"set colorcolumn=80
" switch width marker
nnoremap <silent> <Leader>c :silent set colorcolumn=80<CR>:set colorcolumn?<CR>
nnoremap <silent> <Leader>C :silent set colorcolumn=<CR>:set colorcolumn?<CR>

" keep some context when moving
set scrolloff=1
set sidescrolloff=5

" move freely
set virtualedit=all


" enable search highlighting
set hlsearch
" enable incremental search
set incsearch
" case-sensitive search
set noignorecase
set nosmartcase

" swap search highlight
nnoremap <silent> <Leader><Leader> :nohlsearch<CR>
nnoremap <silent> <Leader>h :silent set hlsearch!<CR>:set hlsearch?<CR>
" swap case-insensitive search
nnoremap <silent> <Leader>i :silent set ignorecase!<CR>:set ignorecase?<CR>


" clipboard "

" use system registry by default
set clipboard=unnamed
" alternate mapping using Leader for when <F12> is unavailable
nnoremap <silent> <Leader>p :silent set paste!<CR>


" appearance "

" readable colors on dark background
colorscheme desert

" enable statusbar
set laststatus=2
set statusline=%<%f\ [%{&encoding}]%{&paste?'\ (p)\ ':''}%h%m%r%=%-14.(%l,%c%V%)\ %P
" enable wildmenu for tab-completion
set wildmenu
" show all matches, complete longest
set wildmode=list:longest
" avoid to open python bytecode
set wildignore=*.swp,*.py[co],*.class,*.beam

" show line numbers in statusbar
set ruler
" show line numbers on the side
set number
" swap line numbering
nnoremap <silent> <Leader>n :silent set number!<CR>
nnoremap <silent> <Leader>N :silent set relativenumber!<CR>

" line bookmarks
sign define bookmark text=@
nnoremap <silent> <Leader>b :exe ":sign place " . line(".") . " name=bookmark line=" . line(".") . " file=" . expand("%:p")<CR>
nnoremap <silent> <Leader>B :sign unplace<CR>
nnoremap <silent> <Leader>* :sign unplace *<CR>


" whitespace and indentation "

" allow backspacing over everything in insert-mode
set backspace=indent,eol,start
" insert spaces by default
set expandtab

" show tabs, trailing spaces and other stuff
set list
" avoid unicode to prevent issues with PuTTY
set listchars=tab:-\ ,trail:_,precedes:<,extends:>

" remove trailing spaces on the current line
nnoremap <silent> <Leader>s :silent s/\s\+$<CR>
" remove trailing spaces on entire buffer without altering the cursor position
" TODO avoid changing the search pattern and highlighting
nnoremap <silent> <Leader>S :let _pos = getpos(".")<CR>:silent keepjumps %s/\s\+$//e<CR>:call setpos(".", _pos)<CR>

" tab and indent width
set softtabstop=4
set shiftwidth=4
" exceptions
au FileType ruby,html{,django},xml,eruby,javascript setlocal sw=2 sts=2

" special mode for text files
fun! TextMode(mode) range
    if a:mode == 'textmode'
        "setlocal filetype=text
        setlocal wrap
        setlocal colorcolumn=
        setlocal nolist
        setlocal linebreak
        nnoremap <buffer> j gj
        nnoremap <buffer> k gk
        nnoremap <buffer> 0 g0
        nnoremap <buffer> $ g$
        echo 'textmode'
    else
        "filetype detect
        setlocal nowrap
        setlocal colorcolumn=80
        setlocal list
        setlocal nolinebreak
        nunmap <buffer> j
        nunmap <buffer> k
        nunmap <buffer> 0
        nunmap <buffer> $
        echo 'notextmode'
    endif
endfun
nnoremap <Leader>t :call TextMode('textmode')<CR>
nnoremap <Leader>T :call TextMode('notextmode')<CR>

" helpful remappings "

" mimic D
nnoremap Y y$

" shortcuts to change buffers the same way as tabs
nnoremap gb :bn<CR>
nnoremap gB :bp<CR>
" and to previous buffer
nnoremap g. :b#<CR>

" do not move the cursor when highlighting
" TODO find a more elegant way to do this :P
nnoremap * *Nzz
nnoremap # #Nzz


" vim zen "

" avoid using escape to exit insert-mode (Ctrl-j is default)
inoremap <CR> <ESC>
" damn you latexmode! DO NOT STEAL MY <C-j>!!
imap <Leader><C-J> <Plug>IMAP_JumpForward
nmap <Leader><C-J> <Plug>IMAP_JumpForward
vmap <Leader><C-J> <Plug>IMAP_JumpForward

" use enter/backspace to add/remove lines in normal mode
nnoremap <CR> o<ESC>
nnoremap <Backspace> ddk
" space in normal-mode saves all (modified) files
nnoremap <Space> :wa<CR>

" use arrows to navigate split-windows
nnoremap <Up>    <C-w>k
nnoremap <Down>  <C-w>j
nnoremap <Left>  <C-w>h
nnoremap <Right> <C-w>l

" easier normal mode plus consistent forward-backward repeat movement
noremap , :
noremap : ,

" language-specific debuggers
autocmd FileType python nnoremap <Leader>d oimport pdb; pdb.set_trace()<Esc>
autocmd FileType python nnoremap <Leader>D Oimport pdb; pdb.set_trace()<Esc>
autocmd FileType python setlocal makeprg=pyflakes\ %\ &&\ pep8\ --ignore=E501\ %

autocmd FileType ruby nnoremap <Leader>d orequire "byebug"; debugger<Esc>
autocmd FileType ruby nnoremap <Leader>D Orequire "byebug"; debugger<Esc>

autocmd FileType eruby nnoremap <Leader>d o<% require "byebug"; debugger %><Esc>
autocmd FileType eruby nnoremap <Leader>D O<% require "byebug"; debugger %><Esc>

autocmd FileType haml nnoremap <Leader>d o- require "byebug"; debugger<Esc>
autocmd FileType haml nnoremap <Leader>D O- require "byebug"; debugger<Esc>

autocmd FileType java setlocal makeprg=javac\ %

" handy command to properly indent json files
fun! JsonTool() range
    execute a:firstline . "," . a:lastline . "!python -m json.tool"
endfun
comm! -range JsonTool <line1>,<line2>call JsonTool()

" extras "

" taken from /etc/vimrc
" Only do this part when compiled with support for autocommands
if has("autocmd")
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif

" taken from /etc/vimrc (arch)
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                  \ | wincmd p | diffthis
endif
