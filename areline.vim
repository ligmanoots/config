" air-line
let g:arline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"Switch to your current theme
let g:airline_theme = 'afterglow'

"Always show tabs
set showtabline=2

"We don't need to see things like -- INSERT -- anymore
set noshowmode
