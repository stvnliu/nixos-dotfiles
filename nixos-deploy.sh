#!/bin/sh
cd ./nixos
sudo stow . -t /etc/nixos/
sudo nixos-rebuild switch
git add -A
git commit -m "$@$(date +"%D::%H:%M:%S") autogen nixos config"
git push
cd ..
