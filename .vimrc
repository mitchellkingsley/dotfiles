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
set tabstop=4                                                              
set shiftwidth=4                                                           
set expandtab                                                              

" Color Options
"set colorcolumn=120                                                        
"highlight colorcolumn ctermbg=7                                            
highlight Search     ctermfg=Black      ctermbg=Red     cterm=NONE
highlight lineNr ctermfg=240
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
    Plug 'https://github.com/yuttie/comfortable-motion.vim.git'
    Plug 'https://github.com/vim-airline/vim-airline.git'
    Plug 'https://github.com/vim-python/python-syntax.git'
call plug#end()

" Nerdtree Settings
map <C-t> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

" Limelight Settings
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = '#777777'
let g:limelight_paragraph_span = 0 
let g:limelight_priority = -1
map <C-l> :Limelight!!<CR>

" Comfortable Motion Settings
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>
