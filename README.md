Usage on UNIX:
--------------
1. Clone into home directory.
2. Rename vimfiles to .vim
2. Create a link: ln -s .vim/.vimrc .vimrc

Usage on Windows:
-----------------
1. Clone into %USERPROFILES%. C:\Users\\<USERNAME>\
2. Rename vimfiles to .vim
2. Create a link for vimfiles: mklink /d vimfiles .vim
3. Create a link for \_vimrc: mklink \_vimrc .vim\\.vimrc

Note: You will need to get Vundle.vim from gmarik/Vundle.vim and place it in
.vim/bundle/
