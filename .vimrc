" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" Vundle

set nocompatible              " be iMproved, required
filetype off                  " required

" install Vundle if it doesn't exist locally
" Taken from https://github.com/fnichol/dotvim/blob/b954d78cee5ecf0bc565cdee3bd211fed5623c5f/home/.vimrc#L103-L131
if has("user_commands")
  " Install Vundle if not already installed
  let InitialVundleInstall = 0

  " Install Vundle if not installed
  if !filereadable(expand('~/.vim/bundle/Vundle.vim/README.md'))
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    let InitialVundleInstall = 1
  endif

  " Load Vundle"
  filetype off
  set runtimepath+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  if filereadable(expand('~/.vim/plugins.vim'))
    source ~/.vim/plugins.vim
  endif
  call vundle#end()

  " Run :PluginInstall if this is the initial Vundle installation
  if InitialVundleInstall == 1
    echo "Running PluginInstall..."
    echo ""
    :PluginInstall
  endif
endif


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'blerins/flattown'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'ervandew/supertab'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'mhinz/vim-startify'
Plugin 'regedarek/ZoomWin'
Plugin 'gcmt/taboo.vim'
"Plugin 'tpope/vim-unimpaired'
"Plugin 'vim-ruby/vim-ruby'
"Plugin 'tpope/vim-surround.git'
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'bling/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'scrooloose/syntastic'
"Plugin 'rust-lang/rust.vim'
"Plugin 'fnichol/rust.vim'
"Plugin 'Chiel92/vim-autoformat'
"Plugin 'powerman/vim-plugin-AnsiEsc'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'majutsushi/tagbar'

call vundle#end()

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



" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0


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

