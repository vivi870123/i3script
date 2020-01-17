" Settings & Extensions {{{
" =====================

let g:coc_auto_open = v:false
let g:coc_global_extensions = [
	\ 'coc-actions',
	\ 'coc-calc',
	\ 'coc-css',
	\ 'coc-diagnostic',
	\ 'coc-emmet',
	\ 'coc-eslint',
	\ 'coc-explorer',
	\ 'coc-git',
	\ 'coc-html',
	\ 'coc-jest',
	\ 'coc-json',
	\ 'coc-lists',
	\ 'coc-markdownlint',
	\ 'coc-marketplace',
	\ 'coc-pairs',
	\ 'coc-phpls',
	\ 'coc-post',
	\ 'coc-prettier',
	\ 'coc-project',
	\ 'coc-python',
	\ 'coc-snippets',
	\ 'coc-spell-checker',
	\ 'coc-styled-components',
	\ 'coc-syntax',
	\ 'coc-todolist',
	\ 'coc-tsserver',
	\ 'coc-vimlsp',
	\ 'coc-word',
	\ 'coc-yaml',
	\ 'coc-yank',
	\ ]

" }}}
" Mappings {{{
" ========
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use enter to accept snippet expansion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" use <c-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" use <c-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" use <c-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" use <c-space>for trigger completion
inoremap <silent> <expr> <c-space> coc#refresh()

" use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gy <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gn <Plug>(coc-rename)
nmap <silent> gh <Plug>(coc-doHover)

" remap for do codeaction of selected region, ex: `<leader>aap` for current paragraph
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" remap for do codeaction of current line
nmap <leader>ac  <Plug>(coc-codeaction)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" }}}
" Autocommands {{{
" ============
augroup user_plugin_coc
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocActionAsync('formatSelected')

	" Update signature help on jump placeholder
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

	" Disable colorcolumn in floating windows
	autocmd User CocOpenFloat setlocal colorcolumn=

	autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

" }}}
" Commands {{{
" ========
" grep word under cursor
command! -nargs=+ -complete=custom,s:grep_args Rg exe 'CocList grep '.<q-args>

" Use `:Format` to format current buffer
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocActionAsync('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" }}}
" Helper Functions {{{
" ================
function! s:show_documentation()
	if (index(['vim', 'help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		let l:found = CocAction('doHover')
	endif
endfunction

function! s:grep_args(...)
	let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
		\ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
	return join(list, "\n")
endfunction

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction

" }}}
" Extensions {{{
" ==========

" coc-explorer
" ============
nnoremap <localleader>e :CocCommand explorer<cr>


" coc-git
" -------
nmap <silent> <expr> [c &diff ? '[c' : '<Plug>(coc-git-prevchunk)'
nmap <silent> <expr> ]c &diff ? ']c' : '<Plug>(coc-git-nextchunk)'
nmap <leader>hi <Plug>(coc-git-chunkinfo)
nnoremap <leader>hs :CocCommand git.chunkStage<cr>
nnoremap <leader>hu :CocCommand git.chunkUndo<cr>

" coc-snippet
" -----------
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

" coc-todolist
" ------------
nnoremap <silent><Leader>tc		:<C-u>CocCommand todolist.create<cr>
nnoremap <silent><Leader>tC		:<C-u>CocCommand todolist.clearNotice<cr>
nnoremap <silent><Leader>tu		:<C-u>CocCommand todolist.upload<cr>
nnoremap <silent><Leader>te		:<C-u>CocCommand todolist.export<cr>
nnoremap <silent><Leader>tl		:<C-u>CocList todolist<cr>

" }}}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
