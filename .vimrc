set mouse=a
syntax on
colorscheme desert
set wildmode=longest,list,full
set wildmenu
set hlsearch
" Window Settings
set number
set wrap!

" Tabbing options
filetype indent plugin on
set guioptions+=b
set tabstop=2
set shiftwidth=2
set expandtab
set cursorline
set cursorcolumn

" Paste Settings
set pastetoggle=<C-p>
noremap <C-n> :set invnumber<CR>
vnoremap <C-c> :w !pbcopy<CR><CR>

" Color Options
"set colorcolumn=120
"highlight colorcolumn ctermbg=7
highlight Search     ctermfg=Black      ctermbg=Red     cterm=NONE
highlight lineNr ctermfg=240
highlight Constant ctermfg=Red
highlight CursorColumn ctermbg=0
highlight CursorLine ctermbg=0
"set colorcolumn=75

" Plugins

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'https://github.com/junegunn/goyo.vim.git'
    Plug 'https://github.com/junegunn/limelight.vim.git'
    Plug 'https://github.com/scrooloose/nerdtree.git'
    "Plug 'https://github.com/yuttie/comfortable-motion.vim.git'
    Plug 'https://github.com/vim-airline/vim-airline.git'
    Plug 'https://github.com/vim-python/python-syntax.git'
    Plug 'https://github.com/bfrg/vim-cpp-modern.git'
    Plug 'https://github.com/christoomey/vim-tmux-navigator'
    "Plug 'https://github.com/github/copilot.vim'
    "Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'

call plug#end()

" Nerdtree Settings
map <C-t> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "left"

" Limelight Settings
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = '#777777'
let g:limelight_paragraph_span = 0
let g:limelight_priority = -1
map <C-l> :Limelight!!<CR>

" Comfortable Motion Settings
"noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
"noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>

" Python Syntax Settings
let g:python_highlight_all = 1

" ctrlp Settings
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlPMixed'

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
