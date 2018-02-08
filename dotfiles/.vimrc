set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'chriskempson/base16-vim'
Plugin 'tpope/vim-surround'
Plugin 'pangloss/vim-javascript'
Plugin 'geekjuice/vim-spec'
Plugin 'mattn/emmet-vim'
Plugin 'rking/ag.vim'
Plugin 'Chun-Yang/vim-action-ag'
Plugin 'tomtom/tcomment_vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'digitaltoad/vim-pug'
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'joshdick/onedark.vim'

call vundle#end()
filetype plugin indent on

" BEGIN: GENERAL CONFIG

" set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

scriptencoding utf-8

" Set temporary directory (don't litter local dir with swp/tmp files)
set directory=/tmp/

set shell=/bin/zsh
" have one hundred lines of command-line (etc) history:
set history=100

" Show us the command we're typing
set showcmd

" Highlight matching parens
set showmatch
set completeopt=menu,preview

" Use the tab complete menu
set wildmenu
set wildmode=list:longest,full

" have the mouse enabled all the time:
set mouse=a

" don't make it look like there are line breaks where there aren't:
set nowrap

" use indents of 2 spaces, and have them copied down lines:
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent

" Set to auto read when a file is changed from the outside
set autoread

" show the `best match so far' as search strings are typed:
set incsearch

" highlight search results
set hlsearch

" always show status line
set laststatus=2

" unicode
set encoding=utf-8

" searching is case insensitive when all lowercase
set ignorecase
set smartcase

" assume the /g flag on :s substitutions to replace all matches in a line:
set gdefault

" make backspace work in insert mode
set backspace=indent,eol,start

" remember last position in file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" accordion effect for multiple panes
" set winwidth=84
" set winheight=5
" set winminheight=5
" set winheight=999

" no beeping
set visualbell

" indent folding, off by default
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" END: GENERAL CONFIG

" BEGIN: PLUGIN-SPECIFIC CONFIG

let g:rspec_command = "!rspec --drb {spec}"
let g:mocha_js_command = "!mocha --recursive --no-colors --compilers js:babel-register {spec}"
let g:mocha_coffee_command = "!mocha -b --compilers coffee:coffee-script{spec}"

" Using test
" let g:rspec_command = 'Dispatch zeus rspec {spec}'
" let g:mocha_coffee_command = '!cortado {spec}' "See geekjuice/vim-mocha

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1

" let g:syntastic_javascript_checkers = ['standard']
" autocmd bufwritepost *.js silent !standard-format -w %
" set autoread

" END: PLUGIN-SPECIFIC CONFIG

" BEGIN: UI CONFIG

" enable line numbers
set number
setlocal numberwidth=2

" These two enable syntax highlighting
set nocompatible
syntax on

" 256 colors
set t_Co=256

" END: UI CONFIG

" BEGIN: KEY MAPPINGS

" remap leader to ,
let mapleader = ","

" get out of insert mode with cmd-i
imap <D-i> <Esc>

" redo with U
nmap U :redo<cr>

" switch windows with g+movement
nmap gj j
nmap gk k
nmap gh h
nmap gl l

nmap gq ^Wq

" swap windows
nmap gS 

" close all other windows (in the current tab)
nmap gW :only<cr>

" close all other tabs
nmap gT :tabonly<cr>

" previous/next buffer (for going without tabs)
nmap g[ :bp<cr>
nmap g] :bn<cr>

" ag for project-wide searching
nmap g/ :Ag -C 1 --group --only-matching --hidden --silent --stats -U
" use * to search current word in normal mode
nmap * <Plug>AgActionWord
" " use * to search selected text in visual mode
vmap * <Plug>AgActionVisual

" align pipe-separated tables for cucumber or textile with g| in visual mode
vmap g\| :Align \|<cr>

" insert blank lines without going into insert mode
nmap go o<esc>
nmap gO O<esc>

" open the source in a browser for distribution or copying as RTF
nmap gH :OpenHtml<cr>

" scroll up/down one line at a time
nmap <Up> 
nmap <Down> 

" scroll left/right
nmap <Left> zh
nmap <Right> zl

" Make NERDTree a bit easier to use
nmap <Leader>n :NERDTree<cr>

" Make ctrlp.vim plugin easy to get to
nmap <Leader>f :CtrlP<cr>
nmap <Leader>m :CtrlPMRUFiles<cr>
nmap <Leader>b :CtrlPBuffer<cr>

" vim-spec bindings
nmap <Leader>t :call RunCurrentSpecFile()<CR>
nmap <Leader>s :call RunNearestSpec()<CR>
nmap <Leader>l :call RunLastSpec()<CR>

" search for the word under the cursor
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/

" remove search hilighting
nmap <silent> <Leader>h :silent :nohlsearch<CR>

" Bubble single lines (uses unimpaired.vim)
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Emmit.vim Tab Completion
imap <expr> <S-tab> emmet#expandAbbrIntelligent("\<tab>")

" END: KEY MAPPINGS

" BEGIN: GUI CONFIGURATION

set guifont=Menlo:h16
set linespace=2
colorscheme base16-nerdnoir
let g:airline_theme="base16_eighties"
set background=dark
" END: GUI CONFIGURATION
