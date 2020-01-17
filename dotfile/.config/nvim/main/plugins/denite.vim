call denite#custom#option('_', {
	\ 'prompt': '❯',
	\ 'auto_resume': 1,
	\ 'highlight_matched_char': 'WildMenu',
	\ 'highlight_matched_range': 'Visual',
	\ 'highlight_window_background': 'Visual',
	\ 'highlight_filter_background': 'StatusLine',
	\ 'max_dynamic_update_candidates': 50000,
	\ 'smartcase': 1,
	\ 'source_names': 'short',
	\ 'split': 'floating',
	\ 'start_filter': 1,
	\ 'statusline': 0,
	\ 'vertical_preview': 1
	\ })

" Allow customizable window positions: top (default), bottom, center
function! s:denite_resize(position)
	if a:position ==# 'top'
		call denite#custom#option('_', {
			\ 'winwidth': (&columns / 2) - 1,
			\ 'winheight': &lines / 3,
			\ 'wincol': 0,
			\ 'winrow': 1,
			\ })
	elseif a:position ==# 'bottom'
		call denite#custom#option('_', {
			\ 'winwidth': (&columns / 2) - 1,
			\ 'winheight': &lines / 3,
			\ 'wincol': 0,
			\ 'winrow': ((&lines - 3) - (&lines / 3)) - 1,
			\ })
	elseif a:position ==# 'center'
		" This is denite's default
	else
		echoerr
			\ 'Unknown position for s:denite_position (' . string(a:position) . ')'
	endif
endfunction

call s:denite_resize(get(g:, 'denite_position', 'center'))

" remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

call denite#custom#var('outline', 'command', ['ctags'])
call denite#custom#var('outline', 'options', ['-f -', '--excmd=number'])

" Ripgrep
if executable('rg')
	call denite#custom#var('file/rec', 'command',
		\ ['rg', '--files', '--glob', '!.git'])
	call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
	call denite#custom#var('grep', 'recursive_opts', [])
	call denite#custom#var('grep', 'final_opts', [])
	call denite#custom#var('grep', 'separator', ['--'])
	call denite#custom#var('grep', 'default_opts',
		\ ['-i', '--vimgrep', '--no-heading'])
endif

" converters
" ==========
call denite#custom#source('buffer,file_mru,file_old', 'converters', ['converter_relative_word'])

" Change matchers.
call denite#custom#source('file/rec', 'matchers', ['matcher/fruzzy', 'converter/abbr_word'])
call denite#custom#source('file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])

call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
	\ [ '.git/', '__pycache__/', 'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

" events
" ======
augroup user_plugin_denite
	autocmd!
	autocmd FileType denite call s:denite_settings()
	autocmd FileType denite-filter call s:denite_filter_settings()
	autocmd VimResized * call s:denite_resize(get(g:, 'denite_position', 'center'))

	autocmd WinEnter * if &filetype =~# '^denite'
		\ |   highlight! link CursorLine WildMenu
		\ | endif

	autocmd WinLeave * if &filetype ==# 'denite'
		\ |   highlight! link CursorLine NONE
		\ | endif
augroup END

function! s:denite_settings() abort
	" Window options
	setlocal signcolumn=no cursorline

	" Key mappings
	nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
	nnoremap <silent><buffer><expr> i    denite#do_map('open_filter_buffer')
	nnoremap <silent><buffer><expr> /    denite#do_map('open_filter_buffer')
	nnoremap <silent><buffer><expr> dd   denite#do_map('do_action', 'delete')
	nnoremap <silent><buffer><expr> p    denite#do_map('do_action', 'preview')
	nnoremap <silent><buffer><expr> st   denite#do_map('do_action', 'tabopen')
	nnoremap <silent><buffer><expr> sg   denite#do_map('do_action', 'vsplit')
	nnoremap <silent><buffer><expr> sv   denite#do_map('do_action', 'split')
	nnoremap <silent><buffer><expr> '    denite#do_map('quick_move')
	nnoremap <silent><buffer><expr> q    denite#do_map('quit')
	nnoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
	nnoremap <silent><buffer><expr> r    denite#do_map('redraw')
	nnoremap <silent><buffer><expr> yy   denite#do_map('do_action', 'yank')
	nnoremap <silent><buffer><expr> <Esc>   denite#do_map('quit')
	nnoremap <silent><buffer><expr> <Tab>   denite#do_map('choose_action')
	nnoremap <silent><buffer><expr><nowait> <Space> denite#do_map('toggle_select').'j'
endfunction

function! s:denite_filter_settings() abort
	" window options
	setlocal signcolumn=yes nocursorline nonumber norelativenumber

	" key mappings
	nnoremap <silent><buffer><expr> <Esc>		denite#do_map('quit')
	inoremap <silent><buffer><expr> <Esc>		denite#do_map('quit')
	nnoremap <silent><buffer><expr> q				denite#do_map('quit')
	inoremap <silent><buffer><expr> <CR>		denite#do_map('do_action')
	imap		 <silent><buffer>				<C-o>		<Plug>(denite_filter_quit)
	inoremap <silent><buffer><expr> <C-c>		denite#do_map('quit')
	nnoremap <silent><buffer><expr> <C-c>		denite#do_map('quit')
	imap		 <silent><buffer>				<C-j>   <Plug>(denite_filter_quit)ji
	imap		 <silent><buffer>				<C-k>   <Plug>(denite_filter_quit)ki
endfunction


" vim: set ts=2 sw=2 tw=80 noet :
