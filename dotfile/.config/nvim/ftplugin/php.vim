autocmd FileType php set nofoldenable

setlocal formatoptions=qroct " Correct indentation after opening a phpdocblock
setlocal matchpairs-=<:>     " Annoying when not closing <?php tag
setlocal makeprg=php\ -l\ %  " Use php syntax check when doing :make
setlocal errorformat=%m\ in\ %f\ on\ line\ %l
setlocal iskeyword+=\\       " Add the namespace separator as a keyword
setlocal iskeyword+=$
setlocal path+=/usr/local/share/pear

" Don't use the PHP syntax folding
setlocal foldmethod=syntax

let b:phpfold_use = 1
let b:phpfold_docblocks = 1
let b:phpfold_text_percent = 1
let b:phpfold_text_right_lines = 1
let b:phpfold_group_iftry = 1
let b:phpfold_doc_with_funcs = 0

" Finish line with semicolon
nnoremap <C-a> A;<Esc>0
