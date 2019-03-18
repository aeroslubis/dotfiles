"                                 ___
"        ___        ___          /__/\
"       /__/\      /  /\        |  |::\
"       \  \:\    /  /:/        |  |:|:\
"        \  \:\  /__/::\      __|__|:|\:\
"    ___  \__\:\ \__\/\:\__  /__/::::| \:\
"   /__/\ |  |:|    \  \:\/\ \  \:\~~\__\/
"   \  \:\|  |:|     \__\::/  \  \:\
"    \  \:\__|:|     /__/:/    \  \:\
"     \__\::::/      \__\/      \  \:\
"         ~~~~                   \__\/
" Vim plugins
call plug#begin('~/.vim/plugged')
	Plug 'junegunn/vim-easy-align'
	Plug 'scrooloose/nerdtree'
	Plug 'sheerun/vim-polyglot'
	Plug 'wincent/terminus'
	Plug 'maralla/completor.vim'
	Plug 'tpope/vim-surround'
	Plug 'majutsushi/tagbar'
	Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-commentary'
	Plug 'w0rp/ale'
	" Plug 'junegunn/goyo.vim'
    Plug 'Yggdroot/indentLine'
    Plug 'tommcdo/vim-lion'
    " Plug 'SirVer/ultisnips'
    Plug 'wellle/targets.vim'
    Plug 'rhysd/clever-f.vim'
    " Plug 'ctrlpvim/ctrlp.vim'
    Plug 'rstacruz/vim-closer'
    " Plug 'cocopon/shadeline.vim'
call plug#end()

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

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set textwidth=80
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
" set noexpandtab
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
highlight LineNr ctermfg=black

"if exists('$TMUX')
"	"Colors in tmux
"endif

" Colorschemes
" set t_Co=256
set background=dark
" set termguicolors
" let g:monotone_color = [20, 100, 70] " Sets theme color to bright green
" let g:monotone_secondary_hue_offset = 200 " Offset secondary colors by 200 degrees
" let g:monotone_emphasize_comments = 1 " Emphasize comments
" colorscheme onehalfdark
" colorscheme monotone
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_uniform_status_lines = 0
let g:nord_comment_brightness = 12
colorscheme nord

" make vim use terminal background
" hi Normal ctermbg=NONE

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

" Readmes autowrap text:
autocmd BufRead,BufNewFile *.md set tw=79
