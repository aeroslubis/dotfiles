let g:ale_pattern_options = {
\   '.*\.json$': {'ale_enabled': 0},
\   '.*\.ino$': {'ale_enabled': 0},
\}

let g:ale_linters = {
\   'shell': ['shfmt'],
\}


" highlight clear ALEErrorSign
" highlight clear ALEWarningSign

nnoremap <silent> [l :ALEPreviousWrap<Enter>
nnoremap <silent> ]l :ALENextWrap<Enter>
