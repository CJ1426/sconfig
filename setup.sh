#!/bin/sh
if [ ! -f "~/.bashrc" ]; then
	cat ./config/bashrc > ~/.bashrc
fi

if [ ! -f "~/.profile" ]; then
	cat ./config/bashrc > ~/.profile
	echo 'export ENV=$HOME/.bashrc' >> ~/.profile
fi

if [ ! -f "~/.inputrc" ]; then
	cat ./config/inputrc > ~/.inputrc
fi

if [ ! -f "~/.tmux.conf" ]; then
	cat ./config/tmux.conf > ~/.tmux.conf
fi

echo "setup nftable" > Todo.list
echo "setup doas : permit persist :wheel" >> Todo.list
echo "setup ssh" >> Todo.list
