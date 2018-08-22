" Get the running system
let uname = system("uname")

" Common settings
set nocompatible
set hidden              " Allow switching buffers without writing to disk
set tabstop=4
set expandtab
set backspace=2
set shiftwidth=4

" Make search work case depedant with caps only
set ignorecase
set smartcase

" Enable syntax highlighting
syntax enable
set background=dark

" Choose mapping to terminal colours
"colorscheme default

" Tell terminal to use all the colours
if uname == "SunOS"
    set t_Co=16
else
    set t_Co=256
endif

" Use dark blue for highlight colour (perhaps useful for solarized)
hi Search CTermfg=11

" Show line numbers
set number

" Indent when writing, turn off for pasting
filetype plugin indent on
set pastetoggle=<F10>

" Quick shortcut to get rid of search highlight
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
imap <C-L> <ESC>
vmap <C-L> <ESC>

" Work relative to current file
autocmd BufEnter * :lcd %:p:h

" Don't use current directory for swap files
set directory-=.

" Use F5 to remove trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Enable the mouse for selections
set mouse=a
