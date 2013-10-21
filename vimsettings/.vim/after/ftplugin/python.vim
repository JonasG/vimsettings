" Make sure Python behaves more like defined in PEP8
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal smarttab
setlocal expandtab

set tags=./tags;

if executable('ctags')
	autocmd BufWrite *.py :silent !ctags *.py
endif
