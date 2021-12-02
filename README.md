# emacs_config

This is my Emacs configuration.

I've borrowed quite a lot from Jessica Hamrick https://github.com/jhamrick/emacs - thanks Jessica!

## Installation (Ubuntu 20.04)

Add to `.profile`:

```
export WORKON_HOME=$HOME/.virtualenvs
```

```
sudo apt-get install emacs autoconf build-essential cmake texinfo llvm libclang-dev zlib1g-dev
git clone git@github.com:martinburchell/emacs_config.git
cd
ln -s ~/emacs_config/.emacs
ln -s ~/emacs_config/.emacs.d
cd ~/bin
ln -s ~/emacs_config/update-ag-ignore.py
emacs -nw
```
