set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)



" General settings
filetype plugin indent on     " Automatically detect file types.
syntax on		      " Syntax highlighting
set mouse=a                   " Automaticaly enable mouse usage
set mousehide                 " Hide the mouse cursor while typing
set enc=utf-8
scriptencoding utf-8

if has('clipboard')
        if has('unnamedplus') " When possible use + register for copy-paste
            set clipboard=unnamedplus
        else " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
endif 

set autowrite                   " Automatically write a file when leaving a modified buffer
set shortmess+=filmnrxoOtT      " Abbrev. of messages (avoids 'hit enter')
set virtualedit=onemore         " Allow for cursor beyond last character
set history=1000                " Store a ton of history (default is 20)
set spell                       " Spell checking on
set hidden                      " Allow buffer switching without saving
                                









" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" Deps 
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'mileszs/ack.vim'


" General 
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-surround'
Bundle 'townk/vim-autoclose'
Bundle 'kien/ctrlp.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'vim-scripts/sessionman.vim'
Bundle 'bling/vim-airline'
Bundle 'Lokaltog/powerline', {'rtp':'/powerline/bindings/vim'}
Bundle 'bling/vim-bufferline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'godlygeek/csapprox'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'mbbill/undotree'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'mhinz/vim-signify'
Bundle 'osyo-manga/vim-over'


" Programming
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'godlygeek/tabular'
Bundle 'majutsushi/tagbar'

" Snippets & AutoComplete 
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'
Bundle 'honza/vim-snippets'
Bundle 'Shougo/neocomplete.vim.git'

" Python
Bundle 'klen/python-mode'
Bundle 'python.vim'
Bundle 'python_match.vim'
Bundle 'pythoncomplete'

" Javascript
Bundle 'elzr/vim-json'
Bundle 'groenewege/vim-less'
Bundle 'pangloss/vim-javascript'
Bundle 'briancollins/vim-jst'
Bundle 'kchmck/vim-coffee-script'

" Java
Bundle 'derekwyatt/vim-scala'
Bundle 'derekwyatt/vim-sbt'

" Haskell
Bundle 'amirh/HTML-AutoCloseTag'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'gorodinskiy/vim-coloresque'
Bundle 'tpope/vim-haml'

" Go 
Bundle 'Blackrush/vim-gocode'

" Twig 
Bundle 'beyondwords/vim-twig'





" Color scheme

if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"
        color solarized " Load a colorscheme
endif


set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode
"set cursorline                  " Highlight current line
highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode
let g:CSApprox_hook_post = ['hi clear SignColumn'] "highlight clear CursorLineNr   Remove highlight color from current line number



if has('cmdline_info')
    set ruler " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd " Show partial commands in status line and
" Selected characters/lines in visual mode
endif


if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif


set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" Formatting
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current

autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
autocmd FileType haskell setlocal expandtab shiftwidth=2 softtabstop=2
" preceding line best in a plugin but here for now.
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
" Workaround vim-commentary for Haskell
autocmd FileType haskell setlocal commentstring=--\ %s
" Workaround broken colour highlighting in Haskell
autocmd FileType haskell setlocal nospell


" Key (re)Mappings
let mapleader = ","
let g:mapleader = ","



" Plugins


" Misc {
        let g:NERDShutUp=1
        let b:match_ignorecase = 1
    " }


" Ctags {
        set tags=./tags;/,~/.vimtags

        " Make tags placed in .git/tags file available in all levels of a repository
        let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
        if gitroot != ''
            let &tags = &tags . ',' . gitroot . '/.git/tags'
        endif
    " }

" NerdTree {
        map <C-e> <plug>NERDTreeTabsToggle<CR>
        map <leader>e :NERDTreeFind<CR>
        nmap <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=0
    " }

" vim-airline {
        " Set configuration options for the statusline plugin vim-airline.
        " Use the powerline theme and optionally enable powerline symbols.
        " To use the symbols , , , , , , and .in the statusline
        " segments add the following to your .vimrc.before.local file:
           let g:airline_powerline_fonts=1
        " If the previous symbols do not render for you then install a
        " powerline enabled font.

        " See `:echo g:airline_theme_map` for some more choices
        " Default in terminal vim is 'dark'
        if !exists('g:airline_theme')
            let g:airline_theme = 'solarized'
        endif
        if !exists('g:airline_powerline_fonts')
            " Use the default set of separators with a few customizations
            let g:airline_left_sep='›'  " Slightly fancier than '>'
            let g:airline_right_sep='‹' " Slightly fancier than '<'
        endif
    " }






