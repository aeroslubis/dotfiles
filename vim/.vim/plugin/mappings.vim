" Command mode
" Jump to the beginning and end of line.
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Jump previous and next commands from history.
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>

" Navigate left and right characters.
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

" Construct substitute command with 'very magic' mode.
cnoremap :s substitute/\v//gc<Left><Left><Left><Left>

" Construct global command with 'very magic' mode.
cnoremap :g global/\v/<Left>

" Write ready-only file
cnoremap w!! w !sudo tee % >/dev/null

" Command mode
" Pane nagivation.
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Always search with 'very magic' mode.
nnoremap / /\v
nnoremap ? ?\v

" Forward and backward jump.
nnoremap J 5j
nnoremap K 5k

" Override Ex mode with run @q.
nnoremap Q @q

" Go back to last buffer shortcut.
nnoremap <C-b> <C-^>

" Alternative beginning and end of line mappings.
nnoremap H ^
xnoremap H ^
onoremap H ^
nnoremap L $
xnoremap L g_
onoremap L $

" Always send contents of a `x` command to the black hole register.
nnoremap x "_x

" Make `Y` acting like `C`, `D`.
nnoremap Y y$

" Refactor word under cursor.
nnoremap c* *``cgn
nnoremap c# #``cgN

" Use `s` for registers.
" nnoremap s "

" Correct bad indent while pasting.
nnoremap [p P=`]
nnoremap ]p p=`]

" Scroll viewport faster.
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" Select last changed or yanked area.
nnoremap <expr> gV '`[' . strpart(getregtype(), 0, 1) . '`]'

" Open URL under cursor in browser or open path in GUI explorer.
nnoremap <silent> gb :execute printf('silent !xdg-open "%s" 2>/dev/null', expand('<cfile>'))<Enter>

" Toggle common options.
nnoremap <silent> cos :set spell!<Enter>
nnoremap <silent> cow :set wrap!<Enter>
nnoremap <silent> coh :set hlsearch!<Enter>
nnoremap <silent> coH :let @/ = ''<Enter>
nnoremap <silent> col :set list!<Enter>
nnoremap <silent> cop :set paste!<Enter>

" Add [count] blank lines above or below the cursor.
nnoremap [<Space> :<C-u>put! =repeat(nr2char(10), v:count1) <Bar> ']+1<Enter>
nnoremap ]<Space> :<C-u>put =repeat(nr2char(10), v:count1) <Bar> '[-1<Enter>

" Navigation mappings for [l]ocation list.
nnoremap <silent> =ol :lopen<Enter>
nnoremap <silent> [l :lprevious<Enter>
nnoremap <silent> ]l :lnext<Enter>
nnoremap <silent> [L :lpfile<Enter>
nnoremap <silent> ]L :lnfile<Enter>
nnoremap <silent> [<C-l> :lfirst<Enter>
nnoremap <silent> ]<C-l> :llast<Enter>

" Navigation mappings for [q]uickfix list.
nnoremap <silent> =oq :copen<Enter>
nnoremap <silent> [q :cprevious<Enter>
nnoremap <silent> ]q :cnext<Enter>
nnoremap <silent> [Q :cpfile<Enter>
nnoremap <silent> ]Q :cnfile<Enter>
nnoremap <silent> <Up> :cprevious<Enter>
nnoremap <silent> <Down> :cnext<Enter>
nnoremap <silent> <Left> :cpfile<Enter>
nnoremap <silent> <Right> :cnfile<Enter>
nnoremap <silent> [<C-q> :cfirst<Enter>
nnoremap <silent> ]<C-q> :clast<Enter>

" Navigation mappings for [b]uffer list.
nnoremap <silent> =ob :buffers!<Enter>
nnoremap <silent> [b :bprevious<Enter>
nnoremap <silent> ]b :bnext<Enter>
nnoremap <silent> [B :bfirst<Enter>
nnoremap <silent> ]B :blast<Enter>

" Navigation mappings for [a]rgument list.
nnoremap <silent> =oa :args<Enter>
nnoremap <silent> [a :previous<Enter>
nnoremap <silent> ]a :next<Enter>
nnoremap <silent> [A :first<Enter>
nnoremap <silent> ]A :last<Enter>

" Navigation mappings for [t]abs.
nnoremap <silent> =ot :tabs<Enter>
nnoremap <silent> [t :tabprevious<Enter>
nnoremap <silent> ]t :tabnext<Enter>

" Navigation mappings for ta[g]s.
nnoremap <C-]> g<C-]>
nnoremap <silent> =og :tags<Enter>
nnoremap <silent> [g :pop<Enter>
nnoremap <silent> ]g :tag<Enter>

" Resize current window sizes.
nnoremap <S-Up> 2<C-w>+
nnoremap <S-Down> 2<C-w>-
nnoremap <S-Right> 2<C-w>>
nnoremap <S-Left> 2<C-w><

" Leader
" Shortcuts for quiting.
nnoremap <silent> <Leader>q :quit<Enter>
nnoremap <silent> <Leader>Q :q!<Enter>
nnoremap <silent> <Leader>w :w<Enter>
nnoremap <silent> <Leader>W :wq<Enter>

" Insert an empty new line without entering insert mode.
nnoremap <Leader>o :<C-u>put =repeat(nr2char(10), v:count1)<Enter>
nnoremap <Leader>O :<C-u>put! =repeat(nr2char(10), v:count1)<Enter>
