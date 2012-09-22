call pathogen#infect()
set history=1000

set encoding=utf-8
set showmatch
set mat=5
set laststatus=2   " Always show the statusline
set backspace=2
set modeline
set modelines=5

set ignorecase
set smartcase
set nonumber

set t_Co=256

" colorscheme Monokai
colorscheme wombat
" colorscheme desert

syntax enable
set ruler

filetype plugin on
filetype indent on

autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

augroup filetype
   au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

set ai
set si
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab
set shiftround
set smarttab

set hidden

"Draw tabs/newlines/trailing spaces
"set listchars=tab:°,,eol:°,trail:·,extends:#

set listchars=tab:»»,trail:·,extends:#
set list
"
"
" function to only add tabs at the beginning
" " of the line, use spaces elsewhere so that if
" " tabstop changes, the non-indent formatting is
" " maintained
"function AddTab()
"	let line = getline('.')
"	let pos = col('.')
"	if col('.') == 1 || strpart(line, 0, pos-1) =~ '^\t*$' || line =~ '^$'
"		return "\t"
"	else
"		return repeat(" ", &tabstop)
"	endif
"endfunction
""
"imap <silent> <Tab> <C-r>=AddTab()<CR>"

" Global tracker var
let g:HighlightLongLines = 0 "set to 0 so we can run it to enable
" Function to toggle highlighting of lines longer than 80 character
" It also toggles textwidth to 80 so newlines are forced when typing
fu! ToggleHighlightLongLines()
    if(g:HighlightLongLines == 1)
        " Disable highlighting and textwidth
        highlight clear rightMargin
        "set textwidth=0
        let g:HighlightLongLines = 0
    else
        " Enable highlighting and textwidth
        "set textwidth=80
        highlight rightMargin ctermbg=LightRed guibg=LightRed
        let foo = 'match rightMargin /\%>'.&textwidth.'v/'
        exec foo
        let g:HighlightLongLines = 1
    endif
endfunction


" Riak
 au BufNewFile,BufRead **/*.erl :set expandtab tabstop=4 shiftwidth=4 tw=78
 au BufNewFile,BufRead **/*.erl :call ToggleHighlightLongLines()
"
"
" Change to working directory
autocmd BufEnter * cd %:p:h"

" Haskell stuff
au BufEnter *.hs compiler ghc
let g:haddock_browser = "/usr/bin/google-chrome"
let g:ghc = "/usr/bin/ghc"

map <F2> :call ToggleHighlightLongLines()<CR>
nnoremap <F4> :NERDTreeToggle<CR>
nnoremap <F3> :TagbarToggle<CR>
map <C-X> :Bufferlist<CR>

" map <F5> :call TMiniBufExplorer()<CR>
map <F6> :botright copen<CR>

set guioptions-=T  "remove toolbar
set guifont=Menlo\ for\ Powerline
let g:Powerline_symbols = 'fancy'
call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

highlight Cursor guifg=black guibg=yellow
" :autocmd FileType qf wincmd J

set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>


