set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'vim-scripts/hexman.vim'
Bundle 'hrp/EnhancedCommentify'
Bundle 'msanders/snipmate.vim'
Bundle 'fs111/pydoc.vim'
Bundle 'nvie/vim-flake8'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'vim-scripts/JSON.vim'
Bundle 'sjl/gundo.vim'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'h1mesuke/unite-outline'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/syntastic'

filetype indent plugin on
syntax on


" Hides buffers instead of closing them. Better undo history and makes it
" possible to switch buffers without saving.
set hidden

" Always show statusline, to work with vim-airline.
set laststatus=2

set history=2000

set nobackup
set nostartofline

" Settings for searching
set incsearch
set hlsearch
set smartcase
set wildmenu
set wildmode=list:longest,full
set ignorecase
set smartcase

set number

" Make backspace behave correctly
set backspace=2

set showmatch
set splitbelow
set linebreak

" GUI options
if has("gui_running")
	set background=dark
	colo solarized
	set guioptions-=m
	set guioptions-=T
	set nostartofline
	set noerrorbells
	set visualbell

	if has("win32")
		set guifont=Consolas:h11

		" This starts Vim maximized. Only on Windows.
		au GUIEnter * simalt ~x
	endif
else
	" Desert looks ok in the console and it is possible to see search
	" results on Windows, bettern than most color schemes.
	set background=dark
	colo desert
endif

" Programming stuff
set smartindent
set autoindent
set cindent

let g:EnhCommentifyRespectIndent = 'Yes'
let g:EnhCommentifyPretty = 'Yes'


" Selection color for omni completion
highlight Pmenu ctermfg=black ctermbg=grey
highlight PmenuSel ctermfg=yellow ctermbg=blue
highlight Cursorline ctermfg=black ctermbg=grey

" Map leader to be comma, and backslash to be reverse character search.
let mapleader=","
noremap \ ,

nnoremap j gj
nnoremap k gk

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

inoremap <c-BS> <c-w>

nnoremap <c-m> :nohl<cr>

" Easy usage of quickfix
nnoremap <f3> :cn<cr>
nnoremap <f4> :cp<cr>

" Move between buffers
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>

map <F7> :make<Enter>

" Let's me select the word under the cursor using space, in VISUAL mode.
noremap <space> viw

" Open up .vimrc quickly, allowing me to add new settings
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source .vimrc quickly
nnoremap <leader>sv :source $MYVIMRC<cr>

set completeopt=menuone,longest,preview

command! -range PrettyPrintJson :<line1>,<line2>!python -m json.tool

" Show a vertical column at textwidth + 1's column
if v:version >= 703
	set colorcolumn=+1
	highlight ColorColumn ctermbg=darkgrey
endif

if executable('ack')
	" grep settings, use ack!
	set grepprg=ack\ --nogroup\ --column\ $*
	set grepformat=%f:%l:%c:%m
endif

" Use Enumerate on a range to give each row a number that is increased by 1.   
function! Enumerate() range
	let l:count = 1
	let l:output = l:count . '. '
	execute(a:firstline . "," . a:lastline .  'g/./s/^/\=l:output/ | let l:count = l:count + 1 | let l:output = l:count . ". "')
endfunction

nnoremap <leader>e :call Enumerate()<cr>
vnoremap <leader>e :call Enumerate()<cr>

" Unite mappings
let g:unite_source_history_yank_enable = 1
nnoremap <leader>y :Unite -no-split history/yank<cr>
nnoremap <leader>f :Unite -no-split -auto-preview -start-insert file<cr>
nnoremap <leader>r :Unite -no-split -start-insert file_rec/async<cr>
nnoremap <leader>g :Unite -no-split -start-insert grep:.<cr>
nnoremap <leader>b :Unite -no-split -quick-match buffer<cr>
nnoremap <leader>o :Unite -no-split -start-insert outline<cr>
nnoremap <leader>m :Unite -no-split -start-insert file_mru<cr>

if executable('ack')
	let g:unite_source_grep_command = 'ack'
	let g:unite_source_grep_default_opts = '--no-heading --no-color -a -H'
	let g:unite_source_grep_recursive_opt = ''
endif

" Filetype discovery stuff
au BufNewFile,BufRead SConstruct,sconstruct,SConscript,sconscript set ft=python

function! CopyBack()
	let search_for = input("Search string: ")
	execute "?" . search_for . "?t."
endfunction

function! CopyForward()
	let search_for = input("Search string: ")
	execute "/" . search_for . "/t."
endfunction

nnoremap <leader>cb :call CopyBack()<cr>
nnoremap <leader>cf :call CopyForward()<cr>
