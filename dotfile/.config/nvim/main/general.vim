" Neo/vim Settings
" ===

" General {{{
set mouse=nv										 " Disable mouse in command-line mode
set modeline										 " utomatically setting options from modelines
set report=0										 " Don't report on line changes
set noerrorbells								 " No trigger bell on error
set novisualbell
set signcolumn=yes							 " Always show signs column
set hidden											 " hide	buffers when abandoned instead of unload
set autoread										 " Set to auto read when a file is changed from the outside
set fileformats=unix,dos,mac		 " Use Unix as the standard file type
set path=.,**										 " Directories to search when using gf
set virtualedit=block						 " Position cursor anywhere in visual block
set synmaxcol=1000							 " Don't syntax highlight long lines
set formatoptions=
set formatoptions+=1						 " Don't break lines after a one-letter word
set formatoptions+=j						 " Remove comment leader when joining lines
set formatoptions-=o						 " Don't continue comment using o or O
set formatoptions-=t						 " Don't auto-wrap text
set viewoptions=cursor,folds,slash,unix

if has('vim_starting')
	set encoding=utf-8
	scriptencoding utf-8
endif

if has('clipboard')
	set clipboard& clipboard+=unnamedplus
endif

" }}}
" Wildmenu {{{
" --------
if has('wildmenu')
	set nowildmenu
	set wildmode=list:longest,full
	set wildoptions=tagfile
	set wildignorecase
	set wildignore+=.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*
	set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
	set wildignore+=**/node_modules/**,**/bower_modules/**,*/.sass-cache/*
	set wildignore+=application/vendor/**,**/vendor/ckeditor/**,media/vendor/**
	set wildignore+=__pycache__,*.egg-info,.pytest_cache
endif

" }}}
" Vim Directories {{{
" ---------------
set undofile noswapfile nobackup nowritebackup
set directory=$DATA_PATH/swap//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set undodir=$DATA_PATH/undo//,$DATA_PATH,~/tmp,/var/tmp,/tmp

" Disabled for coc.nvim compat
set backupdir=$DATA_PATH/backup/,$DATA_PATH,~/tmp,/var/tmp,/tmp
set viewdir=$DATA_PATH/view/
set nospell spellfile=$VIM_PATH/spell/en.utf-8.add

" History saving
set history=1000 " Sets how many lines of history VIM has to remember
if has('nvim')
	set shada='300,<50,@100,s10,h
else
	set viminfo='300,<10,@50,h,n$DATA_PATH/viminfo
endif

" If sudo, disable vim swap/backup/undo/shada/viminfo writing
if $SUDO_USER !=# '' && $USER !=# $SUDO_USER
		\ && $HOME !=# expand('~'.$USER)
		\ && $HOME ==# expand('~'.$SUDO_USER)

	set noswapfile
	set nobackup
	set nowritebackup
	set noundofile
	if has('nvim')
		set shada="NONE"
	else
		set viminfo="NONE"
	endif
endif

" Secure sensitive information, disable backup files in temp directories
if exists('&backupskip')
	set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*
	set backupskip+=.vault.vim
endif

" Disable swap/undo/viminfo/shada files in temp directories or shm
augroup user_secure
	autocmd!
	silent! autocmd BufNewFile,BufReadPre
		\ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim
		\ setlocal noswapfile noundofile nobackup nowritebackup viminfo= shada=
augroup END

" }}}
" Tabs and Indents {{{
" ----------------
set textwidth=80    " Text width maximum chars before wrapping
set noexpandtab     " Don't expand tabs to spaces.
set tabstop=2       " The number of spaces a tab is
set softtabstop=2   " While performing editing operations
set shiftwidth=2    " Number of spaces to use in auto(indent)
set smarttab        " Tab insert blanks according to 'shiftwidth'
set autoindent      " Use same indenting on new lines
set smartindent     " Smart autoindenting on new lines
set noshiftround      " Round indent to multiple of 'shiftwidth'

" Global setting. I don't edit C-style code all the time so don't default to
" C-style indenting.
set nocindent

" }}}
" Timing {{{
" ------
set timeout ttimeout
set timeoutlen=500  " Time out on mappings
set updatetime=300  " Idle time to write swap and trigger CursorHold
set ttimeoutlen=10  " Time out on key codes

" }}}
" Searching {{{
" ---------
set ignorecase      " Search ignoring case
set smartcase       " Keep case when searching with *
set infercase       " Adjust case in insert completion mode
set incsearch       " Incremental search
set wrapscan        " Searches wrap around the end of the file
set showmatch       " Jump to matching bracket
set matchpairs+=<:> " Add HTML brackets to pair matching
set matchtime=1     " Tenths of a second to show the matching paren
set cpoptions-=m    " showmatch will wait 0.5s or until a char is typed
set complete-=i			" included files: prevent a condition where vim lags due to searching include files.
set complete-=t


if executable('rg')
	set grepformat=%f:%l:%m
	let &grepprg = 'rg --vimgrep' . (&smartcase ? ' --smart-case' : '')
endif

" }}}
" Behavior {{{
" --------
set nowrap                      " No wrap by default
set linebreak                   " Break long lines at 'breakat'
set breakat=\ \	;:,!?           " Long lines break chars
set nostartofline               " Cursor in same column for few commands
set whichwrap+=h,l,<,>,[,],~    " Move to following line on certain keys
set splitbelow splitright       " Splits open bottom right
set switchbuf=useopen,usetab    " Jump to the first open window in any tab
set switchbuf+=vsplit           " Switch buffer behavior to vsplit
set backspace=indent,eol,start  " Intuitive backspacing in insert mode
set diffopt=filler,iwhite       " Diff mode: show fillers, ignore whitespace
set completeopt=menuone         " Always show menu, even for one item
" set completeopt+=noselect       " Do not select a match in the menu

" Do not insert any text for a match until the user selects from menu
set completeopt+=noinsert

set diffopt+=internal,algorithm:patience

" }}}
" Editor UI {{{
" --------------------
set noshowmode          " Don't show mode in cmd window
set noshowcmd             " Show command in status line

set shortmess=aocOTIF     " Shorten messages and don't show intro
set scrolloff=2         " Keep at least 2 lines above/below
set sidescrolloff=5     " Keep at least 5 lines left/right
set nonumber            " Don't show line numbers
set noruler             " Disable default status ruler
set nolist                " Show hidden characters

set showtabline=2       " Always show the tabs line
set winwidth=30         " Minimum width for active window
set winminwidth=10      " Minimum width for inactive windows
set winheight=2         " Minimum height for active window
set winminheight=1      " Minimum height for inactive window
set pumheight=15        " Pop-up menu's line height
set helpheight=12       " Minimum help window height
set previewheight=12    " Completion preview height

set cmdheight=1         " Height of the command line
set cmdwinheight=3      " Command-line lines
set equalalways         " Resize windows on split or close
set laststatus=2        " Always show a status line
set display=lastline

if has('folding')
	set foldmethod=syntax
	set foldlevel=999                     " very high === all folds open
	set foldlevelstart=99
	set nofoldenable
endif

" Utility functions
" =================
" if exists('&pumblend')
" 	" pseudo-transparency for completion menu
" 	set pumblend=5
" endif
"
" if exists('&winblend')
" 	" pseudo-transparency for floating window
" 	set winblend=5
" endif

" }}}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
