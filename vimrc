set nocompatible              " be iMproved, required
filetype off                  " required
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ColorSchemeMenuMaker'
Plugin 'rainux/vim-desert-warm-256'
Plugin 'derekwyatt/vim-scala'
Plugin 'fatih/vim-go'
Plugin 'chrisbra/Colorizer'

Plugin 'scrooloose/syntastic'
call vundle#end()
filetype plugin indent on

map <C-t> <esc>:tabnew<CR>
map <C-d> <esc>:! 
map <C-a> <esc>:w<CR>
imap <C-a> <esc>:w<CR>
map <C-x> <esc>:wq<CR>
imap <C-x> <esc>:wq<CR>
map § <esc>:nohlsearch<CR>
map ' <esc>*<CR>
map , <esc><C-w>w<CR>
inoremap <C-f> <C-O>za
nnoremap <C-f> za
onoremap <C-f> <C-C>za
vnoremap <C-f> zf
map k gk
map j gj

" replace visual selection without overwriting default register
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vnoremap <silent> <expr> p <sid>Repl()

set wrap
set wildmenu
set wildmode=list:full
set smarttab
set noincsearch
set ignorecase smartcase
set laststatus=4
set number
set list
set listchars=tab:--,trail:░,extends:>,precedes:<
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set encoding=utf-8
set wildignore+=*.class,*.aux,*.pdf,*.log,*~
set ruler
let g:solarized_termcolors=256
set term=xterm-256color
set background=dark
set shell=/bin/zsh
colorscheme solarized
" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
set runtimepath+=$GOROOT/misc/vim
set backspace=indent,eol,start
let g:syntastic_cpp_compiler_options = '-std=c++0x -Wall -pedantic'
set foldmethod=indent
set nofoldenable
set foldlevel=1
let g:colorizer_auto_filetype='css,html'

