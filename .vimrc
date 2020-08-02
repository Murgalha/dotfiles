"#################### MURILO'S CORPORATION ####################

set nocompatible
syntax on 
filetype plugin indent on
let vimDir = '$HOME/.vim'

if filereadable(expand(vimDir . '/autoload/pathogen.vim'))
    execute pathogen#infect()
endif 

if isdirectory(expand(vimDir . '/bundle/dracula'))
    colorscheme dracula
endif

if isdirectory(expand(vimDir . '/bundle/emmet-vim'))
    let g:user_emmet_install_global = 0
    autocmd filetype html,css EmmetInstall
    let g:user_emmet_leader_key='<C-Z>'
endif

" Do as the name says
set showmode

" Enable switching buffers without saving
set hidden

" Set many colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set t_Co=256
set termguicolors

" Setting tab size and style
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Show matching brackets
set showmatch

" autoindent lines
set autoindent

" Show relative line number
set number relativenumber

" Show ruler on bottom
set ruler

" Find files
set path+=**
set wildmenu

" Search options
set ignorecase smartcase
set hlsearch incsearch

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" clearing highlight search
nmap <silent> ,/ :nohlsearch<CR>

" set no backups or swaps
set nobackup
set noswapfile

set backspace=indent,eol,start

if has('autocmd')
	autocmd filetype html,xml,javascript,typescript set expandtab tabstop=2 shiftwidth=2 softtabstop=2
endif

"auto close {
function! s:CloseBracket()
    let line = getline('.')
    if line =~# '^\s*\(struct\|class\|enum\) '
        return "{\<Enter>};\<Esc>O"
    elseif searchpair('(', '', ')', 'bmn', '', line('.'))
        " Probably inside a function call. Close it off.
        return "{\<Enter>});\<Esc>O"
    else
        return "{\<Enter>}\<Esc>O"
    endif
endfunction
inoremap <expr> {<Enter> <SID>CloseBracket()

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

"##############################################################
