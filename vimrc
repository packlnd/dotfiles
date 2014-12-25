map <C-t> <esc>:tabnew<CR>
map <C-a> <esc>:w<CR>
imap <C-a> <esc>:w<CR>
map <C-x> <esc>:wq<CR>
imap <C-x> <esc>:wq<CR>
map § <esc>:nohlsearch<CR>
map ' <esc>*<CR>
map , <esc><C-w>w<CR>
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

execute pathogen#infect()
syntax enable
filetype off
filetype plugin indent on

set wrap
set wildmenu
set wildmode=list:full
set smarttab
set noincsearch
set ignorecase smartcase
set laststatus=2
set number
set list
set listchars=tab:--,trail:░,extends:>,precedes:<
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch
set encoding=utf-8
set wildignore+=*.class,*.aux,*.pdf,*.log,*~
set ruler
let g:solarized_termcolors=256
set term=xterm-256color
set background=dark
colorscheme solarized
" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
set runtimepath+=$GOROOT/misc/vim
set backspace=indent,eol,start
