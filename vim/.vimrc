" Encoding
set encoding=utf-8

" Set compatibility to Vim only.
set nocompatible

"Always show current position
set ruler

" Turn on syntax highlighting.
syntax on

" Turn off modelines
set modelines=0

set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5

" Fixes common backspace problems
set backspace=indent,eol,start

" Enable autocompletion
set wildmode=longest,list,full

" Vim default split tweak
set splitbelow splitright

" Display options
" set noshowmode
set showmode
set showcmd
set cmdheight=1
set nowrap

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
set number

" make vim use terminal background
" hi Normal ctermbg=NONE

" Colorscheme
" if executable('tmux') && $TMUX !=# ''
"     let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"     let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" endif
" set termguicolors
set background=dark
colorscheme nord

" Enable statusline
set laststatus=2
set noshowmode

" Enable incremental search
set incsearch

" Include matching uppercase words with lowercase search term
set ignorecase

" Include only uppercase words with uppercase search term
set smartcase

" Open help in new tab
cabbrev help tab help
cabbrev tab tabnew

" Store info from no more than 100 files at a time, 9999 lines of text
" 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Pane nagivation.
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Yank to system clipboard
function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction

function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

vnoremap <silent> <Leader>y y:call ClipboardYank()<cr>
vnoremap <silent> <Leader>d d:call ClipboardYank()<cr>
nnoremap <silent> <Leader>p :call ClipboardPaste()<cr>p

" Replace the word under cursor
nnoremap <leader>* :%s/\<<c-r><c-w>\>//gc<left><left><left>
