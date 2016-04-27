" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

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
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'airblade/vim-gitgutter'
"Plugin 'jimenezrick/vimerl'
Plugin 'vim-erlang/vim-erlang-compiler.git'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Plugin 'ervandew/supertab'
Plugin 'ntpeters/vim-better-whitespace'
"Plugin 'markdown'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'majutsushi/tagbar'
Plugin 'mhinz/vim-startify'
Plugin 'regedarek/ZoomWin'
Plugin 'scrooloose/syntastic'
Plugin 'rust-lang/rust.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'rizzatti/dash.vim'
Plugin 'powerman/vim-plugin-AnsiEsc'
Plugin 'gcmt/taboo.vim'

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
set formatoptions-=tc
set colorcolumn=80

syntax enable
set ruler

filetype plugin on
filetype indent on


augroup filetype
    au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

    set ai
    set si
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
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
        colorscheme Tomorrow
        "let g:airline_theme='flattown'
        let g:airline_theme='bubblegum'
    else
        "colorscheme Monokai
        colorscheme flattown
        let g:airline_theme='flattown'
    endif


    set guioptions-=T  "remove toolbar
    set guifont=Menlo\ for\ Powerline
    "let g:Powerline_symbols = 'fancy'
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#fnamemod = ':p:.'
    let g:airline#extensions#tabline#enabled = 1
    "let g:airline#extensions#tabline#left_sep = ' '
    "let g:airline#extensions#tabline#left_alt_sep = '|'
    "let g:airline#extensions#tabline#fnamemod = ':t'

    set cursorline
    hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
    hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
    nnoremap <Leader>c :set cursorcolumn!<CR>


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
    "
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlPBuffer'
    let g:ctrlp_working_path_mode = 'ra'

    let g:dash_map = {
                \ 'erlang' : 'erl'
                \ }


    let NERDTreeIgnore = ['\.o$', '\.lo$', '\.swp$']
    let NERDTreeShowHidden=1
    autocmd FileType go autocmd BufWritePre <buffer> Fmt


    " leader is \
    silent! nmap <C-\> :NERDTreeTabsToggle<CR>
    silent! nmap <leader>t :NERDTreeTabsToggle<CR>
    silent! nmap <leader>x :CtrlPBuffer<CR>
    nnoremap <leader>b :TagbarToggle<CR>
    set grepprg=ack\ --nogroup\ --column\ $*
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
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    let g:formatdef_rustfmt = '"rustfmt"'
    let g:formatters_rust = ['rustfmt']

    nmap <Leader>f :Autoformat<CR>
    "au BufWrite * :Autoformat
    "
    :nmap <silent> <leader>d <Plug>DashSearch



    let g:tagbar_type_rust = {
                \ 'ctagstype' : 'rust',
                \ 'kinds' : [
                \'T:types,type definitions',
                \'f:functions,function definitions',
                \'g:enum,enumeration names',
                \'s:structure names',
                \'m:modules,module names',
                \'c:consts,static constants',
                \'t:traits,traits',
                \'i:impls,trait implementations',
                \]
                \}


silent! nmap <C-w>z :ZoomWin<CR>

" http://stackoverflow.com/questions/4896003/how-do-i-stop-vim-from-auto-creating-comments-on-enter-press
" buggy:
"inoremap <expr> <enter> getline('.') =~ '^\s*//' ? '<enter><esc>S' : '<enter>'
nnoremap <expr> O getline('.') =~ '^\s*//' ? 'O<esc>S' : 'O'
nnoremap <expr> o getline('.') =~ '^\s*//' ? 'o<esc>S' : 'o'

let g:taboo_tab_format = "∴ %P/%f%m "
let g:taboo_renamed_tab_format = "∴ %P/%f%m "

hi TabLineSel guifg=White guibg=DarkGray

