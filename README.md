Usage on UNIX:
--------------
1. Clone into home directory
2. Rename vimfiles to .vim
2. Create a link: ln -s .vim/.vimrc .vimrc
3. Also be sure to mkdir ~/.undodir or persistent undo history will not function

Usage on Windows:
-----------------
1. Clone into %USERPROFILE%. C:\Users\USERNAME\
2. Rename vimfiles to .vim
2. Create a link for vimfiles: mklink /d vimfiles .vim
3. Create a link for \_vimrc: mklink \_vimrc .vim\\.vimrc
4. Also be sure to mkdir $HOME\.vim\.undodir or persistent undo history will not function

Note:  
You will also need to install Vundle with the following commands and then run
::PluginInstall from within vim.

cd %USERPROFILE%  
git clone https://github.com/gmarik/Vundle.vim.git %USERPROFILE%/vimfiles/bundle/Vundle.vim
