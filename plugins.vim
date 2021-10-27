" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin('~/.config/nvim/autoload/plugged')

    "Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    "Ranger File Explorer
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    "NerdTree File Explorer
    "Plug 'scrooloose/NERDTree'
    "NerdTree Git status
    "Plug 'xuyuanp/nerdtree-git-plugin'
    "Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    "Git wrapper
    Plug 'tpope/vim-fugitive'
    "Conquer of Completion. COC needs node.js to run
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "Conquer of Completion and Jedi
    Plug 'pappasam/coc-jedi'
    "Jedi another autocomplete
    "Plug 'davidhalter/jedi-vim'
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
    "Test in Vim
    Plug 'janko-m/vim-test'
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
    "Which Key
    Plug 'liuchengxu/vim-which-key'



    set encoding=UTF-8


call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>

":set completeopt-=preview " For No Previews

:colorscheme afterglow

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"


" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins

"COC Stuff
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"" 

" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE



" Vim-Test
" map <F5> :call CompileRun()<CR>
imap <F5> <Esc>:call CompileRun()<CR>
vmap <F5> <Esc>:call CompileRun()<CR>

func! CompileRun()
exec "w"
if &filetype == 'c'
    exec "!gcc % -o %<"
    exec "!time ./%<"
elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %"
elseif &filetype == 'sh'
    exec "!time bash %"
elseif &filetype == 'python'
    exec "!time python3 %"
elseif &filetype == 'html'
    exec "!google-chrome % &"
elseif &filetype == 'go'
    exec "!go build %<"
    exec "!time go run %"
elseif &filetype == 'matlab'
    exec "!time octave %"
endif
endfunc

"Ale syntax checker and linter
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\   'go': ['go', 'golint', 'errcheck']
\}

nmap <silent> <leader>a <Plug>(ale_next_wrap)

" Disabling highlighting
let g:ale_set_highlights = 0

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0


"Prettier and COC
command! -nargs=0 Prettier :CocCommand prettier.formatFile

