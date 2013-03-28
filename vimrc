set history=100
syntax on
filetype plugin indent on
set ruler

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if ! exists("g:leave_my_cursor_position_alone") |
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\ exe "normal g'\"" |
\ endif |
\ endif

" turn backups off
set nobackup
set nowritebackup

" write root owned file when not root
if has('unix')
    cmap w!! %!sudo tee > /dev/null %
endif

" set tabs to default to 2 spaces except for python 
set autoindent
set softtabstop=2
set shiftwidth=2
set expandtab

autocmd FileType python set shiftwidth=4
