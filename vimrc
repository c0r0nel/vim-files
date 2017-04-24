set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" Optional:
 Plugin 'honza/vim-snippets'


" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line




set nocompatible
set nobackup
"set directory=~/.vim/swap

set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab
set backspace=start,indent,eol

autocmd FileType make     set noexpandtab
autocmd FileType python   set noexpandtab

set number
set cindent
set showmatch

set incsearch
set ignorecase
set hlsearch

set encoding=utf8
set tenc=utf8
set fileencoding=utf8

syntax on

" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

set wildmode=longest,full

map <C-T> :tabnew<CR>
let g:fuzzy_ignore = "*.png;*.jpg;*.gif;vendor/**;coverage/**;tmp/**"
let g:fuzzy_matching_limit = 20

" nmap ,t :FuzzyFinderTextMate<CR>
" nmap ,d :execute 'NERDTreeToggle ' . getcwd()<CR>
" Now mapping Command key for better usability
" nmap \o  :FuzzyFinderTextMate<CR>
nmap <D-d> :execute 'NERDTreeToggle ' . getcwd()<CR>
map <Leader>b :FuzzyFinderBuffer<cr>
"map <Leader>d :execute 'NERDTreeToggle ' . getcwd()<cr>

filetype plugin indent on

function! ExecuteFile()
    let file = expand("%")
    if stridx(file, "_spec.rb") != -1

      execute "!spec %"
    elseif stridx(file, "_test.rb") != -1
     execute "!ruby -Itest %"
    elseif stridx(file, ".rb") != -1
     execute "!ruby %"
    elseif stridx(file, ".lisp") != -1
     execute "!clisp %"
    elseif stridx(file, ".feature") != -1
     execute "!cucumber --language es --no-source --no-color %"
    else
     execute "! %"
    endif
endfunction

map <F5> :call ExecuteFile()<CR>

" Use Ack instead of Grep when available
if executable("ack")
    set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

vmap <Leader>g :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
let mapleader = ","

map <D-1> :tabn 1<CR>
map <D-2> :tabn 2<CR>
map <D-3> :tabn 3<CR>
map <D-4> :tabn 4<CR>
map <D-5> :tabn 5<CR>
map <D-6> :tabn 6<CR>
map <D-7> :tabn 7<CR>
map <D-8> :tabn 8<CR>
map <D-9> :tabn 9<CR>

map! <D-1> <C-O>:tabn 1<CR>
map! <D-2> <C-O>:tabn 2<CR>
map! <D-3> <C-O>:tabn 3<CR>
map! <D-4> <C-O>:tabn 4<CR>
map! <D-5> <C-O>:tabn 5<CR>
map! <D-6> <C-O>:tabn 6<CR>
map! <D-7> <C-O>:tabn 7<CR>
map! <D-8> <C-O>:tabn 8<CR>
map! <D-9> <C-O>:tabn 9<CR>

map <F6> :!!<CR>
let g:ragtag_global_maps = 1
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
set gfn=Monaco\ 11
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
set runtimepath^=~/.vim/bundle/ctrlp.vim
