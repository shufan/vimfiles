Usage on UNIX:
--------------
1. Clone into home directory
2. Rename vimfiles to .vim
2. Create a link: ln -s .vim/.vimrc .vimrc
3. Also be sure to mkdir ~/.vim/.undodir or persistent undo history will not function

Usage on Windows:
-----------------
1. Clone into %USERPROFILE%. C:\Users\USERNAME\
2. Rename vimfiles to .vim
2. Create a link for vimfiles: mklink /d vimfiles .vim
3. Create a link for \_vimrc: mklink \_vimrc .vim\\.vimrc
4. Also be sure to mkdir ~\.vim\.undodir or persistent undo history will not function

Note:  
On UNIX, the .vimrc will automatically install vim-plug and run PlugInstall if vim-plug is not found for initial
install. If using windows, you will also need to install vim-plug with the following commands and then run
::PlugInstall from within vim.

md ~\vimfiles\autoload
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile($uri, $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("~\vimfiles\autoload\plug.vim"))
