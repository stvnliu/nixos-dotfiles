#!/bin/sh
cd ./nixos
sudo stow . -t /etc/nixos/
sudo nixos-rebuild switch
git add -A
git commit -m "$@$(date +"%D::%H:%M:%S") v$(sudo nix-env -p /nix/var/nix/profiles/system --list-generations | tail -1 | awk '{print $1}') autogen nixos config"
git push
cd ..
