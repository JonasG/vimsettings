set nocompatible

" Turn on pathogen
call pathogen#infect()
call pathogen#helptags()

" Hides buffers instead of closing them. Better undo history and makes it
" possible to switch buffers without saving.
set hidden

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

if !exists("syntax on")
	syntax on
endif

syntax on
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
	set cursorline

	if has("win32") || has("win64")
		set guifont=Consolas:h11

		" This starts Vim maximized. Only on Windows.
		au GUIEnter * simalt ~x
	endif
endif

" Programming stuff
set smartindent
set autoindent
set cindent

" Minibufexplorer settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1

let g:EnhCommentifyRespectIndent = 'Yes'
let g:EnhCommentifyPretty = 'Yes'

nnoremap j gj
nnoremap k gk
map <F7> :make<Enter>

" Let's me select the word under the cursor using space, in VISUAL mode.
noremap <space> viw

" Set my leader keys
let mapleader="-"
let maplocalleader="-"

" Open up .vimrc quickly, allowing me to add new settings
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source .vimrc quickly
nnoremap <leader>sv :source $MYVIMRC<cr>

" Use jk instead of esc
inoremap jk <esc>
inoremap <esc> <nop>
vnoremap jk <esc>
vnoremap <esc> <nop>

" Pyer, a Python code evaluator that replaces Python code in a range with its
" output
python << EOL
import vim, StringIO,sys
def PyExecReplace(line1,line2):
  r = vim.current.buffer.range(int(line1),int(line2))
  redirected = StringIO.StringIO()
  sys.stdout = redirected
  exec('\n'.join(r) + '\n')
  sys.stdout = sys.__stdout__
  output = redirected.getvalue().split('\n')
  r[:] = output[:-1] # the -1 is to remove the final blank line
  redirected.close()
EOL
command -range Pyer python PyExecReplace(<f-line1>,<f-line2>)

au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
