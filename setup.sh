#!/bin/sh
if [ ! -f "~/.bashrc" ]; then
	cat ./config/bashrc > ~/.bashrc
fi

if [ ! -f "~/.profile" ]; then
	cat ./config/bashrc > ~/.profile
fi

if [ ! -f "~/.inputrc" ]; then
	cat ./config/inputrc > ~/.inputrc
fi

if [ ! -f "~/.tmux.conf" ]; then
	cat ./config/tmux.conf > ~/.tmux.conf
fi
