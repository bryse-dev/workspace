# Install Plugins #

Copy .vim and .vimrc from this repo into your home dir
```
cp .vim ~/
cp .vimrc ~/
```

Open up vim and run the module installer
```
vim

:VundleInstall
```

In order for the YouCompleteMe plugin to work you need to install dependencies
and compile
```
sudo apt install build-essential cmake python3-dev golang
mkdir ~/golang
export GOROOT=~/golang
export GOPATH=~/golang
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer --all
```

Install vim-gtk so that you can use the system clipboard
```
sudo apt install vim-gtk
```

Now, relaunch vim

