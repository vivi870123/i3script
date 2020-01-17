" Key-mappings
" ===

" Non-standard {{{
" ---
" Window-control prefix
nnoremap  [Window]   <Nop>
nmap      s [Window]

" Fix keybind name for Ctrl+Spacebar
map <Nul> <C-Space>
map! <Nul> <C-Space>

" Double leader key for toggling visual-line mode
nmap <silent> <Leader><Leader> V
vmap <Leader><Leader> <Esc>

" duplicate paragraph
nnoremap <leader>cp yap<S-}>p

" Toggle fold
nnoremap <CR> za

" Focus the current fold by closing all others
nnoremap <S-Return> zMza

" Use backspace key for matchit.vim
nmap <BS> %
xmap <BS> %

" Adjust viewports to the same size
map <leader>= <c-w>=

" Exit from input mode
" inoremap jk <Esc>

" jumps
nnoremap <leader>go <C-o>
nnoremap <leader>gi <C-i>
nnoremap g. g;

" copy & paste
nnoremap <leader>cp yap<S-}>p

" Toggle fold
nnoremap <CR> za

" Focus the current fold by closing all others
nnoremap <S-Return> zMza

" Use backspace key for matchit.vim
nmap <BS> %
xmap <BS> %

" jumps
nnoremap go <C-o>
nnoremap gi <C-i>
nnoremap g. g;

" In-menu scrolling
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Scroll pages in menu
inoremap <expr><C-f> pumvisible() ? "\<PageDown>" : "\<Right>"
inoremap <expr><C-b> pumvisible() ? "\<PageUp>" : "\<Left>"
imap     <expr><C-d> pumvisible() ? "\<PageDown>" : "\<C-d>"
imap     <expr><C-u> pumvisible() ? "\<PageUp>" : "\<C-u>"

" insert keymap like emacs
inoremap <C-w> <C-[>diwa
inoremap <C-h> <BS>
inoremap <C-d> <Del>
inoremap <C-u> <C-G>u<C-U>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <expr><C-e> pumvisible() ? "\<C-e>" : "\<End>"

" command line alias
cnoremap <C-p> <Up>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
cnoremap <C-t> <C-R>=expand("%:p:h") . "/" <CR>

" Global niceties {{{
" ---------------
" yank to end
nnoremap Y y$

" no overwrite paste
xnoremap p "_dP

" Start an external command with a single bang
nnoremap ! :!

" Allow misspellings
cnoreabbrev Bd bd
cnoreabbrev bD bd
cnoreabbrev Q! q!
cnoreabbrev Q1 q!
cnoreabbrev Qa qa
cnoreabbrev qw wq
cnoreabbrev Qall! qall!
cnoreabbrev W! w!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" Start new line from any cursor position
inoremap <S-Return> <C-o>o

nnoremap zl z5l
nnoremap zh z5h

" Improve scroll, credits: https://github.com/Shougo
noremap <expr> <C-f> max([winheight(0) - 2, 1])
	\ ."\<C-d>".(line('w$') >= line('$') ? "L" : "M")
noremap <expr> <C-b> max([winheight(0) - 2, 1])
	\ ."\<C-u>".(line('w0') <= 1 ? "H" : "M")
nnoremap <expr> zz (winline() == (winheight(0)+1) / 2) ?
	\ 'zt' : (winline() == 1) ? 'zb' : 'zz'
noremap <expr> <C-e> (line("w$") >= line('$') ? "j" : "3\<C-e>")
noremap <expr> <C-y> (line("w0") <= 1         ? "k" : "3\<C-y>")

" Window control
nnoremap <tab> <C-w>w
nnoremap <C-x> <C-w>x<C-w>w
nnoremap <silent><C-w>z :vert resize<CR>:resize<CR>:normal! ze<CR>

" Select all
nnoremap <silent> gv ggVG

" Select blocks after indenting
xnoremap < <gv
xnoremap > >gv|

" Use tab for indenting
nmap >  >>_
nmap <  <<_

"go to last edit location with ;'
nnoremap <localleader>' ;'

" Select last paste
nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'

" }}}
" File operations {{{
" ---------------

" Switch to the directory of the opened buffer
map <Leader>cd :lcd %:p:h<CR>:pwd<CR>

" Fast saving
nnoremap <silent><Leader>w :write<CR>
vnoremap <silent><Leader>w <Esc>:write<CR>
nnoremap <silent><C-s> :<C-u>write<CR>
vnoremap <silent><C-s> :<C-u>write<CR>
cnoremap <silent><C-s> <C-u>write<CR>
inoremap <silent><C-s> <esc>:write<CR>

cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" }}}
" Editor UI {{{
" ---------

" Quit
nnoremap <silent> q :<C-u>quit<CR>

" Macros
xnoremap . :norm.<CR>
xnoremap Q :'<,'>:normal @q<CR>
nnoremap Q q
nnoremap gQ @q

" Tabs
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprevious<CR>
nnoremap tl  :tablast<CR>
nnoremap tc  :tabclose<CR>
nnoremap tn  :tabnew<CR>
nnoremap tJ  :TabMoveLeft<CR>
nnoremap tK  :TabMoveRight<CR>
nnoremap <silent> <M-j> :<C-U>tabnext<CR>
nnoremap <silent> <M-k> :<C-U>tabprevious<CR>

command! TabMoveLeft call s:tabMoveBy(-2)
command! TabMoveRight call s:tabMoveBy(1)

" }}}
"
" Totally Custom {{{
" --------------

" Remove spaces at the end of lines
nnoremap <silent> ,<Space> :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>

" C-r: Easier search and replace
xnoremap <C-r> :<C-u>call <SID>get_selection('/')<CR>:%s/\V<C-R>=@/<CR>//gc<Left><Left><Left>

" Quick substitute within selected area
xnoremap s :s//gc<Left><Left><Left>

" Returns visually selected text
function! s:get_selection(cmdtype) "{{{
	let temp = @s
	normal! gv"sy
	let @/ = substitute(escape(@s, '\'.a:cmdtype), '\n', '\\n', 'g')
	let @s = temp
endfunction "}}}

" Location/quickfix list movement
" nmap ]c :lnext<CR>
" nmap [c :lprev<CR>
nmap ]q :cnext<CR>
nmap [q :cprev<CR>

" Yank buffer's absolute path to clipboard
nnoremap <Leader>y :let @+=expand("%:~:.")<CR>:echo 'Yanked relative path'<CR>
nnoremap <Leader>Y :let @+=expand("%:p")<CR>:echo 'Yanked absolute path'<CR>

" Drag current line/s vertically and auto-indent
vnoremap <Leader>K :m-2<CR>gv=gv
vnoremap <Leader>J :m'>+<CR>gv=gv
noremap  <Leader>K :m-2<CR>
noremap  <Leader>J :m+<CR>

" go to begining or End of line
nnoremap <silent> B ^
nnoremap <silent> E $
xnoremap <silent> B ^
xnoremap <silent> E $

" }}}
"
" Append modeline to EOF {{{
nnoremap <silent> <Leader>ml :call <SID>append_modeline()<CR>

" Append modeline after last line in buffer
" See: http://vim.wikia.com/wiki/Modeline_magic
function! s:append_modeline() "{{{
	let l:modeline = printf(' vim: set foldmethod=marker ts=%d sw=%d tw=%d %set :',
		\ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
	let l:modeline = substitute(&commentstring, '%s', l:modeline, '')
	call append(line('$'), l:modeline)
endfunction "}}}

" }}}
" Windows and buffers {{{

" Window resizing mappings
if bufwinnr(1)
	noremap <S-Up> <C-W>+
	noremap <S-Down> <C-W>-
	noremap <S-Left> <c-w><
	noremap <S-Right> <c-w>>
endif

nnoremap <silent> [Window]v		:<C-u>split<CR>
nnoremap <silent> [Window]g		:<C-u>vsplit<CR>
nnoremap <silent> [Window]t		:tabnew<CR>
nnoremap <silent> [Window]o		:<C-u>only<CR>
nnoremap <silent> [Window]b		:b#<CR>
nnoremap <silent> [Window]c		:call <sid>close_buffer()<CR>
nnoremap <silent> [Window]C		:call <sid>close_buffer(v:true)<CR>

" Background dark/light toggle and contrasts
nmap <silent> [Window]h :<C-u>call <SID>toggle_background()<CR>
nmap <silent> [Window]- :<c-u>call <SID>toggle_contrast(-v:count1)<cr>
nmap <silent> [Window]= :<c-u>call <SID>toggle_contrast(+v:count1)<cr>

" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
map <leader>p :!opout <c-r>%<CR><CR>

function! s:toggle_background()
	if ! exists('g:colors_name')
		echomsg 'No colorscheme set'
		return
	endif
	let l:scheme = g:colors_name

	if l:scheme =~# 'dark' || l:scheme =~# 'light'
		" Rotate between different theme backgrounds
		execute 'colorscheme' (l:scheme =~# 'dark'
			\ ? substitute(l:scheme, 'dark', 'light', '')
			\ : substitute(l:scheme, 'light', 'dark', ''))
	else
		execute 'set background='.(&background ==# 'dark' ? 'light' : 'dark')
		if ! exists('g:colors_name')
			execute 'colorscheme' l:scheme
			echomsg 'The colorscheme `'.l:scheme
				\ .'` doesn''t have background variants!'
		else
			echo 'Set colorscheme to '.&background.' mode'
		endif
	endif
endfunction

function! s:toggle_contrast(delta)
	let l:scheme = ''
	if g:colors_name =~# 'solarized8'
		let l:schemes = map(['_low', '_flat', '', '_high'],
			\ '"solarized8_".(&background).v:val')
		let l:contrast = ((a:delta + index(l:schemes, g:colors_name)) % 4 + 4) % 4
		let l:scheme = l:schemes[l:contrast]
	endif
	if l:scheme !=# ''
		execute 'colorscheme' l:scheme
	endif
endfunction

function! s:close_buffer(...) abort
	if &buftype !=? ''
		return execute('q!')
	endif
	let l:windowCount = winnr('$')
	let l:totalBuffers = len(getbufinfo({ 'buflisted': 1 }))
	let l:noSplits = l:windowCount ==? 1
	let l:bang = a:0 > 0 ? '!' : ''
	if l:totalBuffers > 1 && l:noSplits
		let l:command = 'bp'
		if buflisted(bufnr('#'))
			let l:command .= '|bd'.l:bang.'#'
		endif
		return execute(l:command)
	endif
	return execute('q'.l:bang)
endfunction

function! s:tabMoveBy(indexDiff)
	let nextTabIndex = tabpagenr() + a:indexDiff
	let lastTabIndex = tabpagenr('$')
	if nextTabIndex > lastTabIndex
		let nextTabIndex = 0
	elseif nextTabIndex < 0
		let nextTabIndex = lastTabIndex
	endif
	execute 'tabmove ' . nextTabIndex
endfunction


" }}}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
