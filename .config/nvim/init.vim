call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

set foldmethod=indent
set foldlevel=99
set foldclose=all
set nofoldenable
set number

colorscheme gruvbox

let g:airline_powerline_fonts = 1

set nowrap
