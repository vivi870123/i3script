" Plugin: vim-markdown
let g:vim_markdown_folding_disabled = 0
let g:vim_markdown_folding_level = 3
let g:vim_markdown_emphasis_multiline = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_edit_url_in = 'vsplit'
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_fenced_languages = [
        \ 'c++=cpp',
        \ 'viml=vim',
        \ 'bash=sh',
        \ 'ini=dosini',
        \ 'js=javascript',
        \ 'json=javascript',
        \ 'docker=Dockerfile',
        \ 'makefile=make',
        \ 'py=python',
        \ 'ts=typescript'
        \ ]

" Plugin: php.vim
let php_var_selector_is_identifier = 1
let php_html_load = 0

" Plugin: html5.vim
let g:html5_event_handler_attributes_complete = 0

let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

" Plugin: vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1

" Plugin: ansible-vim
let g:ansible_extra_keywords_highlight = 1
let g:ansible_template_syntaxes = {
        \   '*.json.j2': 'json',
        \   '*.(ba)?sh.j2': 'sh',
        \   '*.ya?ml.j2': 'yaml',
        \   '*.xml.j2': 'xml',
        \   '*.conf.j2': 'conf',
        \   '*.ini.j2': 'ini'
        \ }
