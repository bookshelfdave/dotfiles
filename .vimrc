" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" vim +PluginInstall +qall

" Vundle

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'blerins/flattown'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'edkolev/tmuxline.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'airblade/vim-gitgutter'
Plugin 'jimenezrick/vimerl'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Plugin 'ervandew/supertab'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'markdown'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'dleonard0/pony-vim-syntax.git'
Plugin 'majutsushi/tagbar'
Plugin 'mhinz/vim-startify'
Plugin 'regedarek/ZoomWin'

call vundle#end()
filetype plugin indent on

set history=1000
set t_Co=256
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
set mouse=a
set clipboard=unnamed


syntax enable
set ruler

filetype plugin on
filetype indent on


augroup filetype
   au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

set ai
set si
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set shiftround
" set smarttab

set hidden

"Draw tabs/newlines/trailing spaces
"set listchars=tab:°,,eol:°,trail:·,extends:#

set listchars=tab:»»,trail:·,extends:#
" set list
set showbreak=↪

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
autocmd BufEnter * cd %:p:h"

if has('gui_running')
    colorscheme flattown
    let g:airline_theme='flattown'
else
  "colorscheme Monokai
  colorscheme flattown
  let g:airline_theme='flattown'
endif


set guioptions-=T  "remove toolbar
set guifont=Menlo\ for\ Powerline
"let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


set cursorline
"hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkgray guifg=white

"augroup CursorLine
"  au!
"  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"  au WinLeave * setlocal nocursorline
"augroup END

map <F2> :call ToggleHighlightLongLines()<CR>
"nnoremap <C-N> :NERDTreeToggle<CR>
nnoremap <F3> :TagbarToggle<CR>
map <silent> <C-X> :Bufferlist<CR>

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"set rtp+=/usr/local/go/misc/vim
if exists("g:did_load_filetypes")
    filetype off
    filetype plugin indent off
endif
set rtp+=/usr/local/Cellar/go/1.3/libexec/misc/vim
filetype plugin indent on
syntax on

map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
set wildignore+=*/tmp/*,*.so,*.beam,*.zip
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"  \ 'file': '\v\.(beam|so|dll)$'
"  \ }
"set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

let g:dash_map = {
        \ 'erlang' : 'erl'
        \ }


let NERDTreeIgnore = ['\.o$', '\.lo$']
let NERDTreeShowHidden=1
autocmd FileType go autocmd BufWritePre <buffer> Fmt


" leader is \
silent! nmap <C-\> :NERDTreeTabsToggle<CR>
silent! nmap <leader>t :NERDTreeTabsToggle<CR>
nnoremap <leader>b :TagbarToggle<CR>
set grepprg=ack\ --nogroup\ --column\ $*
au BufRead,BufNewFile *.citrus set filetype=citrus

nmap <leader>p :setlocal paste! paste?<cr>
nmap <leader>n :setlocal number! number?<cr>

"autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
