augroup user_plugin_cursorword
	autocmd!
	autocmd FileType denite,qf,vista,coc-explorer let b:cursorword=0
	autocmd WinEnter * if &diff | let b:cursorword=0 | endif
	autocmd InsertEnter * let b:cursorword=0
	autocmd InsertLeave * let b:cursorword=1
augroup END
