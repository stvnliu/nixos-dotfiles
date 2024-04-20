# nixos-dotfiles
Personal dotfiles, including nvidia setup etc.
## Installation
First, install `nixos`:
```
nixos-rebuild --flake ".#hostname" --impure
```
Then, for `home-manager`:
```
home-manager switch --flake ".#username@hostname" --impure
```
