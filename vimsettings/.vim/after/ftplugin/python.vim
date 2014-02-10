" Make sure Python behaves more like defined in PEP8
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal smarttab
setlocal expandtab

set tags=./tags;

" Jump to next function
nnoremap gnf /def<cr>

" Jump to previous function
nnoremap gpf ?def<cr>

" Jump to next class
nnoremap gnc /class<cr>

" Jump to previous class
nnoremap gpc ?class<cr>

if executable('ctags')
	autocmd BufWrite *.py :silent !ctags *.py
endif
