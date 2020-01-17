let g:calendar_frame = 'default'
let g:vimwiki_use_calendar = 1
let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_autowriteall = 0
let g:vimwiki_ext2syntax = {
	\ '.md':        'markdown',
	\ '.Rmd':       'markdown',
	\ '.rmd':       'markdown',
	\ '.mdown':     'markdown',
	\ '.markdown':  'markdown',
	\ }

let g:vimwiki_list = [{
	\		'path': '~/Documents/vimwiki',
	\		'syntax': 'markdown', 'ext': '.md'
	\ }]
