set nocompatible              " be iMproved, required
set number "Switch line numbers on
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set wrap
set textwidth=80
set scrolloff=5
set ignorecase
set smartcase
set incsearch
set hlsearch
let mapleader=","


filetype off                  " required
if has('mouse')
  set mouse=a
endif

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" Plugins

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'raimondi/delimitmate'
Plugin 'ironcamel/vim-script-runner'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ConradIrwin/vim-bracketed-paste'
" not working Plugin 'tpope/vim-surround'
Bundle 'altercation/vim-colors-solarized'
Bundle 'honza/vim-snippets'


 " YouCompleteMe and UltiSnips compatibility, with the helper of supertab
 let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
 let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

 Plugin 'ervandew/supertab'
 let g:SuperTabDefaultCompletionType    = '<C-n>'
 let g:SuperTabCrMapping                = 0

 Plugin 'SirVer/ultisnips'
 let g:UltiSnipsExpandTrigger="<tab>"
 let g:UltiSnipsJumpForwardTrigger="<tab>"
 let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Automatically change theme based on time of day
syntax enable
let hour = strftime("%H")
if 6 <= hour && hour < 18
    set background=light
  else
      set background=dark
    endif
set t_Co=16
let g:solarized_termcolors=16
colorscheme solarized

" Ctrl-P to fuzzy find
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Toggle tree view with ctrl + \
nmap <silent> <c-\> :NERDTreeToggle<CR>

" Use ii to exit insert or visual mode. Auto saves on exiting insert mode
inoremap ii <Esc>:w<cr>
vnoremap ii <Esc>

" Ctrl-C to copy to clipboard
vnoremap <C-c> "+y
 
" When pushing j/k on a line that is wrapped, it navigates to the same line,
" just to the expected location rather than to the next line
nnoremap j gj
nnoremap k gk

" ,c to remove search highlighting
map <leader>c :nohl<CR>
 
" Automatically checks vimrc for changes
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC |
    if has('gui_running') | so $MYGVIMRC | endif
augroup END
o0u
