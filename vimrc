" You may need git config --global core.editor $(which vim)

set history=100
set laststatus=2
set nocompatible
" filetype must be set off before loading bundles
filetype off

" filetype can be turned on after bundles
filetype on
syntax on
filetype plugin on
filetype indent on
set ruler

set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
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

autocmd FileType python set shiftwidth=4

highlight ExtraWhiteSpace ctermbg=red guibg=red
match ExtraWhiteSpace /\t/
autocmd InsertEnter * match ExtraWhiteSpace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhiteSpace /\s\+$/
