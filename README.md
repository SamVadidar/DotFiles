# DotFiles

You can clone it and make a sim. Link to your corresponding file

## Example for Vim
### Sim. Link to your Vimrc (make sure you do not use a relative path for simlink"
```  
ln -s FULLPATH/to/this/Vimrc ~/.vimrc
```
### Install Plug manager
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
### Run this command inside vim
```
:PlugInstall
```

### Install YouCompleteMe binary
Note: I do not personally use it and prefer jedi
Make sure you have npm installed by:
```
npm --version
```
If not, install it by:
```
sudo apt-install npm
```
Make sure you are not in superuser mode!
```
cd ~/.vim/plugged/YouCompleteMe/
./install.py --all
```
## Optional
### Install virtualenv
vimrc is configured to work with virtualenv
```
pip install virtualenv
virtualenv <name>
source path/to/virtualenv/bin/activate
```
