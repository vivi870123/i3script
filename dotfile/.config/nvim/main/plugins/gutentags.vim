let g:gutentags_cache_dir = $DATA_PATH . '/tags'
let g:gutentags_exclude_project_root = [ '/usr/local' ]
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_new = 0
let g:gutentags_ctags_exclude_wildignore = 1
let g:gutentags_exclude_filetypes = [ 'defx', 'vista', 'magit', 'denite', 'coc' ]
let g:gutentags_ctags_extra_args = ['--output-format=e-ctags']
let g:gutentags_ctags_exclude = [
	\ '.idea',
	\ '.cache',
	\ '.lock',
	\ '.tox',
	\ '.bundle',
	\ 'bin',
	\ 'build',
	\ 'data',
	\ 'dist',
	\ 'docs',
	\ 'node_modules/*',
	\ 'tags*',
	\ 'venv/',
	\ '*/wp-admin',
	\ '*.json',
	\ '*/wp-content',
	\ '*/wp-includes',
	\ '*/application/vendor',
	\ '*/vendor/ckeditor',
	\ '*/media/vendor',
	\ '*/site-packages/*',
	\ ]
