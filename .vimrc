" disable vi compatibility
set nocompatible
" allow to change buffers without saving them
set hidden
" enable inline ft settings
set modeline

" http://weevilgenius.net/2010/10/vim-tip-relocating-vim-swapfiles/
set dir^=$HOME/.vim/.swp//

" enable syntax highlight
syntax on
" enable filetype-specific features
filetype plugin indent on
" readable colours on dark background
colorscheme desert

" enable mouse by default
set mouse=a
" enable/disable mouse support
nmap <silent> <Leader>m :silent set mouse=a<CR>:set mouse?<CR>
nmap <silent> <Leader>M :silent set mouse=<CR>:set mouse?<CR>


" enable statusbar
set laststatus=2
" TODO make this conditional
" set statusline=%<%f\ %{&paste?'(p)\ ':''}%{GitBranch()}%h%m%r%=%-14.(%l,%c%V%)\ %P
set statusline=%<%f\ %{&paste?'(p)\ ':''}%h%m%r%=%-14.(%l,%c%V%)\ %P
" enable wildmenu for tab-completion
set wildmenu
" configure wildmenu to behave more like bash
set wildmode=longest:full
" avoid trying to open python bytecode
set wildignore=*.py[co]

" show line numbers in statusbar
set ruler
" show line numbers on the side
set number
" swap line numbering
nmap <silent> <Leader>n :silent set number!<CR>

" line bookmarks
sign define bookmark text=@
nmap <silent> <Leader>b :exe ":sign place " . line(".") . " name=bookmark line=" . line(".") . " file=" . expand("%:p")<CR>
nmap <silent> <Leader>d :sign unplace<CR>
nmap <silent> <Leader>D :sign unplace *<CR>


" avoid messing with the screen
set nowrap
" switch line wrap
nmap <silent> <Leader>w :silent set wrap!<CR>:set wrap?<CR>

" keep some context when moving
set scrolloff=1
set sidescrolloff=5


" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" insert spaces by default
set expandtab
" swap tabs/spaces
nmap <silent> <Leader>t :silent set expandtab!<CR>:if &expandtab<CR>:set softtabstop=4<CR>:set shiftwidth=4<CR>:else<CR>:let &softtabstop=&tabstop<CR>:let &shiftwidth=&tabstop<CR>:endif<CR>:set expandtab?<CR>

" show tabs as blank-padded arrows, trailing spaces as middle-dots
set list
set listchars=tab:-\ ,trail:_,precedes:<,extends:>

" tab and indent width
set softtabstop=4
set shiftwidth=4
" shorter for markup files
au FileType {xml,xhtml,html{,django},yaml} setlocal sw=2 sts=2

" autofold
set foldmethod=indent


" enable search highlighting
set hlsearch
" enable incremental search
set incsearch
" case-sensitive search
set noignorecase
set nosmartcase

" mimic D
nmap Y y$

" do not move the cursor when highlighting
nmap * *Nzz
nmap # #Nzz

" swap search highlight
nmap <silent> <Leader><Leader> :nohlsearch<CR>
nmap <silent> <Leader>h :silent set hlsearch!<CR>:set hlsearch?<CR>
" swap case-insensitive search and show current state
nmap <silent> <Leader>i :silent set ignorecase!<CR>:set ignorecase?<CR>

" shortcuts to change buffers the same way as tabs
nmap gb :bn<CR>
nmap gB :bp<CR>
" and to previous buffer
nmap g. :b#<CR>

" remove trailing spaces on the current line
nmap <silent> <Leader>s :silent s/\s\+$<CR>
" remove trailing spaces on entire buffer without altering the cursor position
" TODO avoid changing the search pattern and highlighting
nmap <silent> <Leader>S :let _pos = getpos(".")<CR>:silent keepjumps %s/\s\+$//e<CR>:call setpos(".", _pos)<CR>

" avoid using escape to exit inster mode (<Leader> uses two keystrokes)
imap <CR> <ESC>
imap <C-CR> <CR>
" swap paste mode and force screen refresh to play nice with statusline flag
set pastetoggle=<F12>
map <F12> <F12>

" copy/paste shortcuts
nmap <silent> <Leader>x "+x
nmap <silent> <Leader>c "+y
nmap <silent> <Leader>v "+gP


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
