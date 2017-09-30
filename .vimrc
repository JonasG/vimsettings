""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This .vimrc uses vim-plug (https://github.com/junegunn/vim-plug)
" Make sure to install it before using this config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin-related settings
" Seem to work better if they are set before plugin configuration below
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Force CtrlP to use mixed mode to make it more useable. It will now by
" default search files, mru and buffers
let g:ctrlp_cmd = 'CtrlPMixed'


call plug#begin('~/vimfiles/plugged')
Plug 'tpope/vim-sensible'

" Essential plugins, independent of mode or filetype used
Plug 'ctrlpvim/ctrlp.vim'	" Quick search in files, buffers, mru
Plug 'tpope/vim-obsession'	" Session handling, :Obsession and then
				" 	gvim.exe -S sessionfile.vim
Plug 'tpope/vim-repeat'		" Makes the . command better


" Python plugins
Plug 'klen/python-mode', { 'for': 'python' }

" Clojure plugins
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Color schemes
Plug 'iCyMind/NeoSolarized'

call plug#end()

let g:pymode_python = 'python3'

" Hides buffers instead of closing them. Better undo history and makes it
" possible to switch buffers without saving.
set hidden

" Don't write backup or swapfiles. I never use them anyway.
set nobackup
set noswapfile

" Try to stay in the same column all the time even on blank characters
set nostartofline

" Settings for searching
set incsearch
set hlsearch
set smartcase
set wildmode=list:longest,full
set ignorecase
set smartcase

" Display numbering
set number

set showmatch
set splitbelow
set linebreak

" GUI options
if has("gui_running")
	set background=dark
	colo NeoSolarized
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
	colo NeoSolarized
endif

" Programming stuff
set smartindent
set cindent

" Selection color for omni completion
highlight Pmenu ctermfg=black ctermbg=grey
highlight PmenuSel ctermfg=yellow ctermbg=blue
highlight Cursorline ctermfg=black ctermbg=grey

" Map leader to be comma, and backslash to be reverse character search.
let mapleader=","
noremap \ ,

" This will make vim handle wrapped lines like if they weren't, not skipping
" them when using j or k for navigation.
nnoremap j gj
nnoremap k gk

" Navigation between windows after a split
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

inoremap <c-BS> <c-w>

" Clear the current search highlighting
nnoremap <c-m> :nohl<cr>

function! OpenTempfile()
	let tmpfile = tempname()
	execute 'edit' tmpfile
endfunction

" Open up .vimrc quickly, allowing me to add new settings
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Open a temporary file for quick notes
nnoremap <leader>es :call OpenTempfile()<cr>

" Make searching faster (in Swedish keyboard) by imitation the same keys
" that are used on American keyboard
nnoremap - /
nnoremap _ ?

set exrc

set completeopt=menuone,longest,preview

" Show a vertical column at textwidth + 1's column
if v:version >= 703
	set colorcolumn=+1
	highlight ColorColumn ctermbg=darkgrey
endif

" Filetype related
au BufNewFile,BufRead SConstruct,sconstruct,SConscript,sconscript set ft=python
