call pathogen#infect()
filetype plugin indent on
set number

syntax enable
set background=dark
colorscheme solarized

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set tags=./tags;

" Use ack instead of grep
set grepprg=ack

map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>
vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
