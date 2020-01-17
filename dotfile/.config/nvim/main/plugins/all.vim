if dein#tap('coc.nvim')
	nnoremap <silent><LocalLeader>r :<C-u>CocListResume<CR>
	nnoremap <silent><LocalLeader>f :<C-u>CocList files<CR>
	nnoremap <silent><LocalLeader>b :<C-u>CocList buffers<CR>
	nnoremap <silent><LocalLeader>v :<C-u>CocList yank<CR>
	nnoremap <silent><LocalLeader>l :<C-u>CocList location<CR>
	nnoremap <silent><LocalLeader>q :<C-u>CocList quickfix<CR>
	nnoremap <silent><LocalLeader>g :<C-u>CocList grep<CR>
	nnoremap <silent><LocalLeader>c :<C-u>CocList colors<CR>
	nnoremap <silent><LocalLeader>h :<C-u>CocList helptags<CR>
	nnoremap <silent><LocalLeader>s :<C-u>CocList sessions<CR>
	nnoremap <silent><LocalLeader>o :<C-u>CocList outline<CR>
	nnoremap <silent><LocalLeader>/ :<C-u>CocList lines<CR>
endif

if dein#tap('vista.vim')
	nnoremap <silent> <Leader>o :<C-u>Vista<CR>
	nnoremap <silent> <Leader>O :<C-u>Vista show<CR>
endif

if dein#tap('vim-doge')
	autocmd FileType javascript,javascriptreact,typescript,typescriptreact,python,php
		\ nnoremap <silent> <Leader>d :<C-u>DogeGenerate<CR>
endif

if dein#tap('deol.nvim')
	"[Ctrl + o] display the terminal in the Float Window
	nnoremap <silent><c-t>  :<c-u>Deol -split=vertical<cr>
	" [ESC] exit from the terminal mode
	tnoremap <esc> <c-\><c-n>:exit<cr>
endif

if dein#tap('vim-surround')
	nmap <leader>"	ysiw"
	nmap <leader>'	ysiw'
	nmap <leader>(	ysiw(
	nmap <leader>)	ysiw)
	nmap <leader><	ysiw<
	nmap <leader>>	ysiw>
	nmap <leader><	ysiw<
	nmap <leader>>	ysiw>
	nmap <leader>{	ysiw{
	nmap <leader>}	ysiw}
	nmap <leader>[	ysiw[
	nmap <leader>]	ysiw]
	nmap <leader>`	ysiw`
endif

if dein#tap('vim-operator-replace')
	xmap p <Plug>(operator-replace)
endif

if dein#tap('vim-bookmarks')
  nmap ma :<C-u>cgetexpr bm#location_list()<CR> :<C-u>CocList --normal quickfix<CR>
	nmap mn <Plug>BookmarkNext
	nmap mp <Plug>BookmarkPrev
	nmap mm <Plug>BookmarkToggle
	nmap mi <Plug>BookmarkAnnotate
	nmap mc <Plug>BookmarkClear
	nmap mC <Plug>BookmarkClearAll
endif

if dein#tap('indentLine')
	nmap <silent><Leader>ti :<C-u>IndentLinesToggle<CR>
endif

if dein#tap('committia.vim')
  let g:committia_hooks = {}
  function! g:committia_hooks.edit_open(info)
    imap <buffer><C-d> <Plug>(committia-scroll-diff-down-half)
    imap <buffer><C-u> <Plug>(committia-scroll-diff-up-half)
    setlocal winminheight=1 winheight=1
    resize 10
    startinsert
  endfunction
endif

if dein#tap('goyo.vim')
  nnoremap <Leader>z :Goyo<CR>
endif

if dein#tap('vimagit')
  nnoremap <silent> mg :Magit<CR>
endif

if dein#tap('undotree')
  nnoremap <Leader>u :UndotreeToggle<CR>
endif

if dein#tap('rainbow')
  nmap <silent><Leader>tr :<C-u>RainbowToggle<CR>
endif

if dein#tap('vim-asterisk')
  map *   <Plug>(asterisk-g*)<Plug>(is-nohl-1)
  map #   <Plug>(asterisk-g#)<Plug>(is-nohl-1)
	map n		<Plug>(is-nohl)<Plug>(anzu-n)
	map N		<Plug>(is-nohl)<Plug>(anzu-N-with-echo)
	augroup vim-anzu
		autocmd!
		autocmd CursorHold,CursorHoldI,WinLeave,TabLeave * call anzu#clear_search_status()
	augroup END
endif

if dein#tap('auto-git-diff')
	autocmd user_events FileType gitrebase
		\  nmap <buffer><CR>  <Plug>(auto_git_diff_scroll_manual_update)
		\| nmap <buffer><C-n> <Plug>(auto_git_diff_scroll_down_page)
		\| nmap <buffer><C-p> <Plug>(auto_git_diff_scroll_up_page)
		\| nmap <buffer><C-d> <Plug>(auto_git_diff_scroll_down_half)
		\| nmap <buffer><C-u> <Plug>(auto_git_diff_scroll_up_half)
endif

if dein#tap('splitjoin.vim')
  let g:splitjoin_join_mapping = ''
  let g:splitjoin_split_mapping = ''
  nmap sj :SplitjoinJoin<CR>
  nmap sk :SplitjoinSplit<CR>
endif

if dein#tap('dsf.vim')
  nmap dsf <Plug>DsfDelete
  nmap csf <Plug>DsfChange
endif

if dein#tap('vim-easymotion')
  nmap ss <Plug>(easymotion-s2)
  nmap sd <Plug>(easymotion-s)
  nmap sf <Plug>(easymotion-overwin-f)
  map  sh <Plug>(easymotion-linebackward)
  map  sl <Plug>(easymotion-lineforward)
  map  s/ <Plug>(easymotion-sn)
  omap s/ <Plug>(easymotion-tn)
  map  sn <Plug>(easymotion-next)
  map  sp <Plug>(easymotion-prev)
endif

if dein#tap('vimwiki')
	nnoremap <silent> <Leader>W :<C-u>VimwikiIndex<CR>
endif

if dein#tap('vim-textobj-multiblock')
	omap <silent> ab <Plug>(textobj-multiblock-a)
	omap <silent> ib <Plug>(textobj-multiblock-i)
	xmap <silent> ab <Plug>(textobj-multiblock-a)
	xmap <silent> ib <Plug>(textobj-multiblock-i)
endif

if dein#tap('vim-textobj-function')
	omap <silent> af <Plug>(textobj-function-a)
	omap <silent> if <Plug>(textobj-function-i)
	xmap <silent> af <Plug>(textobj-function-a)
	xmap <silent> if <Plug>(textobj-function-i)
endif
