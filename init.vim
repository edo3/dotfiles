call plug#begin('~/.config/nvim/vim-plug/')

" Plug 'wfxr/minimap.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim'
Plug 'tpope/vim-surround'
Plug 'racer-rust/vim-racer'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'SirVer/ultisnips'
Plug 'hashivim/vim-terraform'

call plug#end()
" Airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Il mio tema

let g:airline_theme='ayu_mirage'

" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
set noshowmode
syntax on
" Indentazione intelligente, servono tutti e due
set autoindent
set smartindent 
" Numero di linea relativo
set relativenumber
set number
" Titolo del file
set title
" Non fa wrappare il testo
set nowrap
" Permette di foldare funzioni, dipende dalla sintassi del linguaggio,
" potrebbe necessitare configurazioni aggiuntive
set foldenable
set foldmethod=syntax
set foldlevel=99
" Scrivo automaticamente i file quando chiamo :make

set autowrite 

" Typescript React

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" Rimappo i comandi per cambiare pannello a CTRL+<DIR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Esegui il codice alla riga attuale in shell e ritorna il risultato al posto
" del comando nel testo

nnoremap Q !!sh<CR>

" Rust autocomplete
let g:racer_cmd = "/usr/local/bin/racer"
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1

" Trigger ultisnips 

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" Definizione in popup in vim-go

let g:go_doc_popup_window = 1

" Autocompletamento in go se premo C-o in mod. insert

au filetype go inoremap <buffer> <C-o> <C-x><C-o>

" Go imports in auto sul salvataggio

let g:go_fmt_command = "goimports"

" Popup errore

:highlight Pmenu ctermbg=246 guibg=246

" Minimappa

" let g:minimap_width = 10
" let g:minimap_auto_start = 1
" let g:minimap_auto_start_win_enter = 1

" Funzione per mostrare definizione sotto il cursore
" Comando: K

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
