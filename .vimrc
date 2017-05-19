set nocompatible              " be iMproved, required
let $GIT_SSL_NO_VERIFY = 'true'

if has('win32')
  let vimPlugBeginPath='~/vimfiles/plugged'
  " vim-plug must be installed manually by running the following commands in powershell
  " md ~\vimfiles\autoload
  " $uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  " (New-Object Net.WebClient).DownloadFile($uri, $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("~\vimfiles\autoload\plug.vim"))
elseif has('unix')
  let vimPlugBeginpath='~/.vim/plugged'
  " vim-plug (https://github.com/junegunn/vim-plug) settings
  " Automatically install vim-plug and run PlugInstall if vim-plug not found
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
  endif
endif

" vim-plug begin
call plug#begin(vimPlugBeginPath)

Plug 'morhetz/gruvbox'
Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'

Plug 'ctrlpvim/ctrlp.vim'
" ctrlp customization START
let g:ctrlp_working_path_mode = 'a'
" ctrlp customization END

Plug 'mhinz/vim-signify'
" vim-signify customization START
let g:signify_realtime = 1
" vim-signify customization END

Plug 'kien/rainbow_parentheses.vim'
" rainbow_parentheses customization START
" Needs to be done after syntax enable for plugin rainbow_parentheses.vim so search for further references to rainbow_parentheses.
" rainbow_parentheses customization END

Plug 'bling/vim-airline'
" airline customization START
let g:airline_powerline_fonts = 1
" airline customization END

" vim-plug end
call plug#end()

" Setting some OS-specific VIM settings
if has('win32')
  if has('gui_running')
    colorscheme gruvbox
    set guifont=Hack:h9
    set undodir=~/vimfiles/.undodir " store all undo history files together. make sure this dir exists.
  endif
elseif has('unix')
  set t_Co=256
  colorscheme gruvbox
  set guifont=Inconsolata\ 13
  set undodir=~/.vim/.undodir/     " store all undo history files together. make sure this dir exists.
endif

" Setting some OS-agnostic VIM settings
"
" rainbow_parentheses customization START
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" rainbow_parentheses customization END

set number
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

