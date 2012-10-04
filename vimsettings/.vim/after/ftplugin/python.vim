" Make sure Python behaves more like defined in PEP8
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal smarttab
setlocal expandtab

" Use omnicomplete for Python
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

set tags=./tags;
autocmd BufWrite *.py :silent !ctags *.py
