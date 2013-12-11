#!/bin/bash

DIR=`dirname $0`

# Vim
if [ -d ~/.vim ] && [ ! -d ~/.vim-orig ]; then
  mv ~/.vim ~/.vim-orig
fi
if [ -f ~/.vimrc ] && [ ! -f ~/.vimrc-orig ]; then
  mv ~/.vimrc ~/.vimrc-orig
fi
rm -rf ~/.vim
cp -R $DIR/.vim* ~

# IRB
if [ -f ~/.irbrc ] && [ ! -f ~/.irbrc-orig ]; then
  mv ~/.irbrc ~/.irbrc-orig
fi
cp $DIR/.irbrc ~

# tmux
if [ -f ~/.tmux.conf ] && [ ! -f ~/.tmux.conf-orig ]; then
  mv ~/.tmux.conf ~/.tmux.conf-orig
fi
cp $DIR/.tmux.conf ~


# Git
if ! grep -q '# start marionm' ~/.gitconfig; then
  echo '# start marionm' >> ~/.gitconfig
  cat $DIR/.gitconfig >> ~/.gitconfig
  echo '# end marionm' >> ~/.gitconfig
fi
cp $DIR/.git-completion.sh ~
cp $DIR/.git-branch-prompt.sh ~

# Bash
cp $DIR/.profile-marionm ~
if ! grep -q profile-marionm ~/.bashrc; then
  echo 'if [ -f ~/.profile-marionm ]; then . ~/.profile-marionm; fi' >> ~/.bashrc
fi
. ~/.bashrc
