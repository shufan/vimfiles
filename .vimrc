set nocompatible              " be iMproved, required
filetype off                  " required
let $GIT_SSL_NO_VERIFY = 'true'

" VUNDLE PLUGINS
" set the runtime path to include Vundle and initialize
if has('win32')
    set rtp+=~/vimfiles/bundle/Vundle.vim/
    let path='~/vimfiles/bundle'
    call vundle#begin(path)
elseif has('unix')
    set rtp+=~/.vim/bundle/Vundle.vim/
    call vundle#begin()
endif
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

 "My Plugins begin here
Plugin 'morhetz/gruvbox'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sleuth'
Plugin 'Raimondi/delimitMate'

Plugin 'kien/ctrlp.vim'
" ctrlp customization START
let g:ctrlp_working_path_mode = 'ca'
" ctrlp customization END

Plugin 'mhinz/vim-signify'
" vim-signify customization START
let g:signify_realtime = 1
" vim-signify customization END

Plugin 'kien/rainbow_parentheses.vim'
" rainbow_parentheses customization START
" Needs to be done after syntax enable for plugin rainbow_parentheses.vim so search for further references to rainbow_parentheses.
" rainbow_parentheses customization END

Plugin 'scrooloose/nerdtree'
" NERDTree customization START
" automatically open NERDTree if vim started with no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" map Ctrl+n as a shortcut to open NERDTree
map <C-n> :NERDTreeToggle<CR>
" NERDTree customization END

Plugin 'bling/vim-airline'
" airline customization START
let g:airline_powerline_fonts = 1
" airline customization END

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
" My Plugins end here

" Setting some OS-specific VIM settings
if has('win32')
  if has('gui_running')
    colorscheme gruvbox
    set guifont=Hack:h9
    set undodir=$HOME\.vim\.undodir " store all undo history files together. make sure this dir exists.
  endif
elseif has('unix')
  set t_Co=256
  colorscheme gruvbox
  set guifont=Inconsolata\ 13
  set undodir=~/.undodir/           " store all undo history files together. make sure this dir exists.
endif

" Setting some OS-agnostic VIM settings
syntax enable
" rainbow_parentheses customization START
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" rainbow_parentheses customization END
set cursorline
set undofile
set noswapfile
let mapleader = ","             " remap leader key to comma
set timeout timeoutlen=1500     " lengthen timeout for key combinations
set ai                          " set auto-indenting on for programming
set showmatch                   " automatically show matching brackets. works like it does in bbedit.
set hlsearch                    " highlight search results
set vb                          " turn on the "visual bell" - which is much quieter than the "audio blink"
set laststatus=2                " make the last line where the status is two lines deep so you can see status always
set backspace=indent,eol,start  " make that backspace key work the way it should
set background=dark             " Use colours that work well on a dark background (Console is usually black)
set showmode                    " show the current mode
set encoding=utf-8
set scrolloff=3
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
nnoremap / /\v
vnoremap / /\v
set gdefault                    " apply substitutions globally on lines
set ignorecase                  " ignore case in search
set smartcase                   " only ignore case if search term is all lower case
set incsearch                   " do incremental search
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
set wrap                        " wrap text
set textwidth=119                " wrap text as close to 79 characters as white space allows
set formatoptions=qrn1          " automatically wrap text without
set list
set listchars=tab:▸\ ,eol:¬

" Working with splits
nnoremap <leader>w <C-w>v<C-w>l " create vertical split and switch to it with ,w
nnoremap <C-h> <C-w>h           " split navigation with hjkl
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Vim tutor
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Used to enable XAML syntax highlighting by setting the filetype to XML
au BufNewFile,BufRead *.xaml set filetype=xml

" Set window size for GUI mode vs vim mode
if has("gui_running")
  "GUI is running or is about to start.
  "Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=999 columns=999
endif

"------------------------------------------------------------------------------
" Only do this part when compiled with support for autocommands.
if has("autocmd")
  "Set UTF-8 as the default encoding for commit messages
  autocmd BufReadPre COMMIT_EDITMSG,git-rebase-todo setlocal fileencodings=utf-8

  "Remember the positions in files with some git-specific exceptions"
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$")
    \           && expand("%") !~ "COMMIT_EDITMSG"
    \           && expand("%") !~ "ADD_EDIT.patch"
    \           && expand("%") !~ "addp-hunk-edit.diff"
    \           && expand("%") !~ "git-rebase-todo" |
    \   exe "normal g`\"" |
    \ endif

    autocmd BufNewFile,BufRead *.patch set filetype=diff
    autocmd BufNewFile,BufRead *.diff set filetype=diff

    autocmd Syntax diff
    \ highlight WhiteSpaceEOL ctermbg=red |
    \ match WhiteSpaceEOL /\(^+.*\)\@<=\s\+$/

    autocmd Syntax gitcommit setlocal textwidth=74
endif " has("autocmd")

