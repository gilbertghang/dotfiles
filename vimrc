set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdTree'
Plugin 'bling/vim-airline'
call vundle#end()

filetype plugin indent on
syntax enable

let mapleader = ','
set showcmd

" Indentation
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=indent,eol,start

" Searching
set showmatch
set ignorecase
set smartcase

" Line Numbering
set number
set relativenumber
highlight LineNr ctermfg=darkblue
highlight CursorLineNr ctermfg=white

" Airline
set laststatus=2
let g:airline#extensions#branch#enabled=1
let g:airline_powerline_fonts=1
set guifont=Inconsolata\ for\ Powerline
let g:airline#extensions#syntastic#enabled=1

" NERDTree
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

function! s:CloseIfOnlyNerdTreeLeft()
    if exists("t:NERDTreeBufName")
        if bufwinnr(t:NERDTreeBufName) != -1
            if winnr("$") == 1
                q
            endif
        endif
    endif
endfunction

" Show All Whitespace
set list listchars=tab:\ \ ,trail:·

" Remove All Trailing Whitespace on Write
function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction

let g:fb_kill_whitespace_blacklist = ["snippets"]
if index(g:fb_kill_whitespace_blacklist, &ft) < 0
  au BufWritePre * :call <SID>StripTrailingWhitespaces()
endif

" Leave Insert Mode Without Delay
if !has('gui_running')
  set ttimeoutlen=10
  augroup fast_escape
    autocmd!
    autocmd InsertEnter * set timeoutlen=0
    autocmd InsertLeave * set timeoutlen=1000
  augroup END
endif
