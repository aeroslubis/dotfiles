" ----------------NERDTree configs----------------
" Display hidden files.
let g:NERDTreeShowHidden = v:true

" Set buffer width.
let g:NERDTreeWinSize = 30

" Keep the tree sync on file deletion or rename.
let g:NERDTreeAutoDeleteBuffer = v:true

" Disable the help text.
let g:NERDTreeMinimalUI = v:true

" Hide some files and folders.
let g:NERDTreeIgnore = [
	\ '^\.DS_Store$[[file]]',
	\ '^\.git$[[dir]]',
	\ '^node_modules$[[dir]]'
\ ]

" Use natural sort order.
let g:NERDTreeNaturalSort = v:true

" Change arrow icons for folders.
let g:NERDTreeDirArrowExpandable = ' ' " U+200B
let g:NERDTreeDirArrowCollapsible = ' ' " U+200B

" Define mappings.
let g:NERDTreeMapActivateNode = 'l'
let g:NERDTreeMapOpenRecursively = ''
let g:NERDTreeMapCloseDir = 'h'
let g:NERDTreeMapCloseChildren = 'H'
let g:NERDTreeMapPreview = 'i'
let g:NERDTreeMapOpenSplit = 'sp'
let g:NERDTreeMapOpenVSplit = 'vs'
let g:NERDTreeMapDeleteBookmark = 'bd'
let g:NERDTreeMapToggleBookmarks = 'bt'
let g:NERDTreeMapJumpParent = 'gp'
let g:NERDTreeMapJumpRoot = 'gr'
let g:NERDTreeMapJumpNextSibling = '<C-j>'
let g:NERDTreeMapJumpPrevSibling = '<C-k>'
let g:NERDTreeMapUpdirKeepOpen = '-'
let g:NERDTreeMapRefresh = 'r'
let g:NERDTreeMapRefreshRoot = 'R'
let g:NERDTreeMapMenu = 'm'
let g:NERDTreeMapChangeRoot = 'zr'
let g:NERDTreeMapToggleHidden = 'zh'
let g:NERDTreeMapToggleZoom = 'zv'
let g:NERDTreeMapHelp = '?'
let g:NERDTreeMapOpenInTabSilent = 't'

" Disable unused mappings.
let g:NERDTreeMapCWD = ''
let g:NERDTreeMapChdir = ''
let g:NERDTreeMapJumpFirstChild = ''
let g:NERDTreeMapJumpLastChild = ''
let g:NERDTreeMapOpenExpl = ''
let g:NERDTreeMapOpenInTab = ''
let g:NERDTreeMapPreviewSplit = ''
let g:NERDTreeMapPreviewVSplit = ''
let g:NERDTreeMapQuit = ''
let g:NERDTreeMapToggleFiles = ''
let g:NERDTreeMapToggleFilters = ''
let g:NERDTreeMapUpdir = ''

" Define mappings.
" map <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>

" Open NERDTree on opeding a directory
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction

autocmd BufEnter * call NERDTreeRefresh()
