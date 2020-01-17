" File Types
" ==========

augroup user_plugin_filetype " {{{
	autocmd!

	" Reload vim config automatically
	autocmd BufWritePost $VIM_PATH/{*.vim,*.yaml,vimrc} nested
		\ source $MYVIMRC | redraw

	" Automatically set read-only for files being edited elsewhere
	autocmd SwapExists * nested let v:swapchoice = 'o'

	" Equalize window dimensions when resizing vim window
	autocmd VimResized * tabdo wincmd =

	" Force write shada on leaving nvim
	autocmd VimLeave * if has('nvim') | wshada! | else | wviminfo! | endif

	" Check if file changed when its window is focus, more eager than 'autoread'
	autocmd FocusGained * checktime

	autocmd Syntax * if line('$') > 5000 | syntax sync minlines=200 | endif

	" Highlight the current line in the current window.
	autocmd BufEnter * set cursorline
	autocmd BufLeave * set nocursorline
	autocmd InsertEnter * set nocursorline
	autocmd InsertLeave * set cursorline

	" Update filetype on save if empty
	autocmd BufWritePost * nested
		\ if &l:filetype ==# '' || exists('b:ftdetect')
		\ |   unlet! b:ftdetect
		\ |   filetype detect
		\ | endif

	" Reload Vim script automatically if setlocal autoread
	autocmd BufWritePost,FileWritePost *.vim nested
		\ if &l:autoread > 0 | source <afile> |
		\   echo 'source '.bufname('%') |
		\ endif

	" When editing a file, always jump to the last known cursor position.
	" Don't do it when the position is invalid or when inside an event handler
	autocmd BufReadPost *
		\ if &ft !~# 'commit' && ! &diff &&
		\      line("'\"") >= 1 && line("'\"") <= line("$")
		\|   execute 'normal! g`"zvzz'
		\| endif

	autocmd FileType crontab setlocal nobackup nowritebackup

	autocmd FileType yaml.docker-compose setlocal expandtab

	autocmd FileType gitcommit setlocal spell

	autocmd FileType gitcommit,qfreplace setlocal nofoldenable

	" https://webpack.github.io/docs/webpack-dev-server.html#working-with-editors-ides-supporting-safe-write
	autocmd FileType css,javascript,jsx,javascript.jsx setlocal backupcopy=yes

	autocmd FileType php
		\ setlocal matchpairs-=<:> iskeyword+=\\ path+=/usr/bin/pear
		\ | setlocal formatoptions=qroct " Correct indent after opening a phpdocblock

	autocmd FileType python
		\ setlocal foldmethod=indent expandtab smarttab nosmartindent
		\ | setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80

	autocmd FileType zsh setlocal foldenable foldmethod=marker

	autocmd FileType html setlocal path+=./;/

	autocmd FileType markdown
		\ setlocal expandtab spell conceallevel=0 wrap nonumber textwidth=80
		\ | setlocal autoindent formatoptions=tcroqn2 comments=n:>

	autocmd FileType apache setlocal path+=./;/

	autocmd FileType cam setlocal nonumber synmaxcol=10000

	" disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

	" runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

	" when shortcut files are updated, renew bash and vifm configs with new material:
	autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts

	" update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

	" run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

augroup END " }}}

" Internal Plugin Settings  {{{
" ------------------------
	" PHP {{{
	let g:PHP_removeCRwhenUnix	= 0
	let g:PHP_default_indenting = 0

	" Don't outdent the <?php tags to the first column
	let g:PHP_outdentphpescape  = 0
	let g:php_htmlInStrings			= 0 " neat! :h php.vim
	let g:php_baselib						= 1 " highlight php builtin functions
	let g:php_noShortTags				= 1
	let g:php_syncmethod				= 10 " :help :syn-sync https://stackoverflow.com/a/30732393/557215


	" }}}
	" Python {{{
	let g:python_highlight_all = 1

	" }}}
	" Vim {{{
	let g:vimsyntax_noerror = 1
	let g:vim_indent_cont = &shiftwidth

	" }}}
	" Bash {{{
	let g:is_bash = 1

	" }}}
	" Java {{{
	let g:java_highlight_functions = 'style'
	let g:java_highlight_all = 1
	let g:java_highlight_debug = 1
	let g:java_allow_cpp_keywords = 1
	let g:java_space_errors = 1
	let g:java_highlight_functions = 1

	" }}}
	" JavaScript {{{
	let g:SimpleJsIndenter_BriefMode = 1
	let g:SimpleJsIndenter_CaseIndentLevel = -1

	" }}}
" }}}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

