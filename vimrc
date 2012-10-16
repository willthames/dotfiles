set history=100
syntax on
filetype plugin on
set ruler

set autoindent
set softtabstop=4
set shiftwidth=4
set expandtab

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

