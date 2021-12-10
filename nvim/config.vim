let mapleader=","
let maplocalleader="\\"

filetype plugin indent on

colorscheme ron

set colorcolumn=80
set copyindent
set clipboard=unnamed
set expandtab
set ignorecase
set inccommand=split
set infercase
set mouse=a
set number
set scrolloff=15
set shiftround
set shiftwidth=2
set showbreak=\\ "
set showmatch
set smartcase
set smartindent
set smarttab
set softtabstop=4
set tabstop=4
set textwidth=80
set wildmode=list:longest,full

let undodir=stdpath("data")."/undo"
if !isdirectory(undodir)
  call mkdir(undodir)
endif
set undofile
let &undodir=undodir

nnoremap j gj
nnoremap k gk

vmap > >gv
vmap < <gv

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>f :Files<cr>
nnoremap <silent> <leader>a :Ag<cr>

nmap <leader>rn <Plug>(coc-rename)
xmap <leader>fmt <Plug>(coc-format-selected)
