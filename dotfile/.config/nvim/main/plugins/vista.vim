
let g:vista_fzf_preview = ['right:50%']
let g:vista_default_executive = 'ctags'
let g:vista_icon_indent = ["▸ ", ""]
let g:vista#renderer#enable_icon = 1
let g:vista_echo_cursor = 0
let g:vista_echo_cursor_strategy = 'echo'
" let g:vista_close_on_jump = 1
let g:vista_sidebar_width = 30
let g:vista_executive_for = {
	\ 'javascript': 'coc',
	\ 'javascriptreact': 'coc',
	\ 'python': 'coc',
	\ 'typescript': 'coc',
	\ 'typescriptreact': 'coc',
	\ 'php': 'coc',
	\ 'jsx': 'coc',
	\}

let g:vista#renderer#icons = {
	\ "function": "\uf794",
	\ "variable": "\uf71b",
	\}

