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
set showmatch
set undofile
set relativenumber
set history=5000
set colorcolumn=80
runtime macros/matchit.vim

" Put buffer window on right side
let g:buffergator_viewport_split_policy = 'R'

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
Plugin 'jiangmiao/auto-pairs'
Plugin 'ironcamel/vim-script-runner'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'tpope/vim-surround'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'kana/vim-textobj-line'
Plugin 'sjl/gundo.vim'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-rooter'
Plugin 'ap/vim-buftabline'
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

" Autopairs shortcuts
let g:AutoPairsShortcutJump = '<Leader>n'

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
 
" F7 to format file
map <F7> mzgg=G`z

" ,a to search with ack
map <Leader>a :Ack 

" F3 to bring up undo tree
nnoremap <F3> :GundoToggle<CR>

" ,,r to run scripts
let g:script_runner_key ='<F5>'

" Ctrl + direction to switch between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Can use ; as substitute for : in normal mode
nnoremap ; :

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" Use ,pp and ,ff to move between buffers
nnoremap <Leader>ff :bnext<CR>
nnoremap <Leader>pp :bprev<CR>

" Use tab to move around brackets
nnoremap <tab> %
vnoremap <tab> %
" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Automatically save on focus lost
au FocusLost * :wa

" Automatically checks vimrc for changes
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC |
    if has('gui_running') | so $MYGVIMRC | endif
augroup END
