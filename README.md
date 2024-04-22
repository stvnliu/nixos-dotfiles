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
## Features
### Specialisations
The configuration is, to the maximum of its ability, modular. By default, it comes with the following specialisations:
- Default: The default configuration
- `test`: 
