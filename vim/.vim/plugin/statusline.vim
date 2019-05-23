scriptencoding UTF-8

" Set status line display
set laststatus=2
" hi StatusLine ctermfg=grey ctermbg=235 cterm=NONE
" hi StatusLineNC ctermfg=grey ctermbg=235 cterm=NONE
" 
" hi TabLineFill ctermfg=black ctermbg=238
" hi TabLine ctermfg=grey ctermbg=236
" hi TabLineSel ctermfg=grey ctermbg=234
" 
hi User1 ctermfg=grey ctermbg=238
hi User2 ctermfg=NONE ctermbg=NONE
hi User3 ctermfg=grey ctermbg=black
hi User4 ctermfg=grey ctermbg=black

set statusline=\                    " Padding
set statusline+=%t                  " Path to the file

"set statusline+=\ %1*\              " Padding & switch colour
"set statusline+=%y                  " File type
set statusline+=\ %2*\              " Padding & switch colour
set statusline+=%=                  " Switch to right-side
" set statusline+="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':''}"
" set statusline+=\ %3*\              " Padding & switch colour
set statusline+=\ %3*\              " Padding & switch colour

" set statusline+=%{FugitiveStatusline()}
set statusline+=\                   " Padding
set statusline+=%y
set statusline+=\                   " Padding

set statusline+=line                " of Text
set statusline+=\                   " Padding
set statusline+=%l                  " Current line
set statusline+=\ %4*\              " Padding & switch colour
set statusline+=of                  " of Text
set statusline+=\                   " Padding
set statusline+=%L                  " Total line
set statusline+=\                   " Padding
