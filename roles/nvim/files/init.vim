"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc
"
set termguicolors
set nofoldenable
set nu! 
set incsearch
set tabstop=2
set smarttab
set shiftround
set nojoinspaces
set shiftwidth=4
set expandtab
set guifont=Source\ Code\ Pro\ 12

"stop nerdtree from popping open every file open
set switchbuf=useopen,usetab


call plug#begin('~/.local/share/nvim/plugged')
    Plug 'neovim/nvim-lspconfig'
    Plug 'davidhalter/jedi-vim'
    Plug 'roxma/nvim-yarp'
    Plug 'scrooloose/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'Raimondi/delimitMate'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'mrk21/yaml-vim'
    Plug 'hashivim/vim-terraform'
    Plug 'ajmwagar/vim-deus'
call plug#end()
colorscheme deus

"Jedi auto close
let g:jedi#auto_close_doc = 0  " close preview window after completion

"Use tab/shift-tab to select completions
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let delimitMate_matchpairs = "(:),[:],{:}"

"NERD Tree settings
"stop nerdtreetabs from opening every time you switch tabs
let g:nerdtree_tabs_open_on_new_tab = 0
"NERD Tree mappings
nnoremap _n :NERDTreeMirrorToggle<CR>

" Map ctrl-movement keys to window switching
nnoremap <C-k> <C-w><Up>
nnoremap <C-j> <C-w><Down>
nnoremap <C-l> <C-w><Right>
nnoremap <C-h> <C-w><Left>

"YAML config
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
"Close popups for auto complete
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

autocmd FileType yaml setlocal et ts=2 ai sw=2 nu sts=0
lua << EOF
require('lspconfig').jedi_language_server.setup{}
EOF
