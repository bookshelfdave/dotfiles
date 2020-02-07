" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" Vundle

set nocompatible              " be iMproved, required
filetype off                  " required


" install Vundle if it doesn't exist locally
" Taken from https://github.com/fnichol/dotvim/blob/b954d78cee5ecf0bc565cdee3bd211fed5623c5f/home/.vimrc#L103-L131
if has("user_commands")
  let InitialPlugInstall = 0

  " Install Plug if not installed
  if !filereadable(expand('~/.vim/autoload/plug.vim'))
    echo "Installing Plug..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let InitialPlugInstall = 1
  endif
endif


call plug#begin('~/.vim/plugged')
Plug 'gmarik/Vundle.vim'
Plug 'blerins/flattown'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
Plug 'ntpeters/vim-better-whitespace'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'mhinz/vim-startify'
Plug 'regedarek/ZoomWin'
Plug 'gcmt/taboo.vim'
"Plug 'tpope/vim-unimpaired'
"Plug 'vim-ruby/vim-ruby'
"Plug 'tpope/vim-surround.git'
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'bling/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'scrooloose/syntastic'
"Plug 'rust-lang/rust.vim'
"Plug 'fnichol/rust.vim'
"Plug 'Chiel92/vim-autoformat'
"Plug 'powerman/vim-plugin-AnsiEsc'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'majutsushi/tagbar'
call plug#end()

filetype plugin indent on
filetype indent on

set ai
set backspace=2
set clipboard=unnamed
set colorcolumn=80
set cursorline
set encoding=utf-8
set expandtab
set formatoptions-=tc
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2   " Always show the statusline
set mat=5
set modeline
set modelines=5
set mouse=a
set nonumber
set noerrorbells visualbell t_vb=
set ruler
set shiftround
set shiftwidth=4
set showmatch
set si
set smartcase
set softtabstop=4
set t_Co=256
set tabstop=4
syntax enable

"Draw tabs/newlines/trailing spaces
"set listchars=tab:°,,eol:°,trail:·,extends:#
set listchars=tab:»»,trail:·,extends:#

" set list
set showbreak=↪

if has('gui_running')
  colorscheme Tomorrow
  let g:airline_theme='bubblegum'
else
  colorscheme flattown
  let g:airline_theme='flattown'
endif


set guioptions-=T  "remove toolbar

"#set guifont=Menlo\ for\ Powerline
"let g:Powerline_symbols = 'fancy'
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#fnamemod = ':p:.'
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#tab_nr_type = 1 

hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorcolumn!<CR>

"nnoremap <C-N> :NERDTreeToggle<CR>
map <silent> <C-X> :Bufferlist<CR>

autocmd GUIEnter * set visualbell t_vb=

if exists("g:did_load_filetypes")
  filetype off
  filetype plugin indent off
endif

syntax on

set wildignore+=*/tmp/*,*.so,*.beam,*.zip

let NERDTreeIgnore = ['\.o$', '\.lo$', '\.swp$']
let NERDTreeShowHidden=1
let g:NERDTreeWinPos = "right"
let g:NERDTreeIndicatorMapCustom = {
\ "Modified"  : "✹",
\ "Staged"    : "✚",
\ "Untracked" : "✭",
\ "Renamed"   : "➜",
\ "Unmerged"  : "═",
\ "Deleted"   : "✖",
\ "Dirty"     : "✗",
\ "Clean"     : "✔︎",
\ "Unknown"   : "?"
\ }


autocmd FileType go autocmd BufWritePre <buffer> Fmt

" leader is \
silent! nmap <C-\> :NERDTreeTabsToggle<CR>
silent! nmap <leader>t :NERDTreeTabsToggle<CR>
silent! nmap <leader>x :CtrlPBuffer<CR>
nnoremap <leader>b :TagbarToggle<CR>
au BufRead,BufNewFile *.citrus set filetype=citrus

nmap <leader>p :setlocal paste! paste?<cr>
nmap <leader>n :setlocal number! number?<cr>

"autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


silent! nmap <C-w>z :ZoomWin<CR>

" http://stackoverflow.com/questions/4896003/how-do-i-stop-vim-from-auto-creating-comments-on-enter-press
" buggy:
"inoremap <expr> <enter> getline('.') =~ '^\s*//' ? '<enter><esc>S' : '<enter>'
nnoremap <expr> O getline('.') =~ '^\s*//' ? 'O<esc>S' : 'O'
nnoremap <expr> o getline('.') =~ '^\s*//' ? 'o<esc>S' : 'o'

let g:taboo_tab_format = "∴ %P/%f%m "
let g:taboo_renamed_tab_format = "∴ %P/%l%m "

hi TabLineSel guifg=White guibg=DarkGray

nmap <leader>p :setlocal paste! paste?<cr>

let g:buftabline_numbers=1

" highlight searches, clear with C-l 
nnoremap <silent> <C-l> :<C-u>nohlsearch<Cr><C-l>

