let g:ale_pattern_options = {
\   '.*\.json$': {'ale_enabled': 0},
\   '.*\.ino$': {'ale_enabled': 0},
\}

let g:ale_linters = {
\   'shell': ['shfmt'],
\}

" hi ALEError       guisp=#ff4444 gui=undercurl ctermfg=203 cterm=bold,underline
" hi ALEWarning     guisp=#dd9922 gui=undercurl ctermfg=214 cterm=bold,underline
" hi ALEErrorSign   guifg=NONE ctermfg=white ctermbg=NONE
" hi ALEWarningSign guifg=NONE ctermfg=NONE ctermbg=NONE

highlight clear ALEErrorSign
highlight clear ALEWarningSign

nnoremap <silent> [l :ALEPreviousWrap<Enter>
nnoremap <silent> ]l :ALENextWrap<Enter>
