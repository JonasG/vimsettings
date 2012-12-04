set nocompatible
filetype indent plugin on
syntax on

" Turn on pathogen
call pathogen#infect()
call pathogen#helptags()

" Hides buffers instead of closing them. Better undo history and makes it
" possible to switch buffers without saving.
set hidden

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
	colo vylight
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
endif

set cursorline

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

" grep settings, use ack!
set grepprg=ack\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m
