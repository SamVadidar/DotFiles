# DotFiles

You can clone it and make a sim. Link to your corresponding file

## Example for Vim
### Sim. Link to your Vimrc
```
ln -s path/to/this/Vimrc ~/.vimrc
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
