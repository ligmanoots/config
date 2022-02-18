set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set clipboard=unnamedplus
set showtabline=2
set incsearch
set ignorecase
set smartcase
set wildmenu
set wildmode=list:longest,full
set noshowmode

call plug#begin()

    "Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    "NerdTree File Explorer
    Plug 'scrooloose/NERDTree'
    "NerdTree Git status
    Plug 'xuyuanp/nerdtree-git-plugin'
    "Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    "Git wrapper
    Plug 'tpope/vim-fugitive'
    "Conquer of Completion. COC needs node.js and npm to run
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "Snippets
    Plug 'honza/vim-snippets'
    "Emmet
    Plug 'mattn/emmet-vim'
    "Ale
    Plug 'w0rp/ale'
    "Airline
    Plug 'vim-airline/vim-airline'
    "Airline themes
    Plug 'vim-airline/vim-airline-themes'
    "Indenter
    Plug 'nathanaelkane/vim-indent-guides'
    "Comment Stuff out
    Plug 'tpope/vim-commentary'
    "Surround endings
    Plug 'tpope/vim-surround'
    "Prettier
    Plug 'prettier/vim-prettier'
    "Developer Icons
    Plug 'ryanoasis/vim-devicons'
    "DIfferent Color Schemes
    Plug 'rafi/awesome-vim-colorschemes'
    "Tagbar
    Plug 'majutsushi/tagbar'
    "Tabular
    Plug 'godlygeek/tabular'
    "vim-terminal
    Plug 'tc50cal/vim-terminal'
    "CSS color
    Plug 'ap/vim-css-color'
    "pywal color schemes
    Plug 'dylanaraps/wal.vim'

    set encoding=UTF-8


call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>

":set completeopt-=preview " For No Previews

"color scheme for pywal
colorscheme wal

"background opacity
highlight Normal ctermbg=none
highlight NonText ctermbg=none


let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"


"COC Stuff
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"" 

"airline
let g:arline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"Switch to your current theme
let g:airline_theme = 'afterglow'

