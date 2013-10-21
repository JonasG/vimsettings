" Markem-Imaje C++ settings
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal smarttab
setlocal expandtab

if executable('ctags')
	autocmd BufWrite *.c,*.h :silent !ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C *.h *.c
endif
