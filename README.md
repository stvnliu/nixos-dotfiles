# nixos-dotfiles
!! This dotfiles directory has since been rewritten and stored in the `stvnliu/nixos-configuration` repository.
!! This dotfiles repository will be archived
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
- `powersave`: The power-saving configuration including alternative nvidia offload mode and disabling database integrations.
## Contributing
This project integrates devenv.sh through `devenv.nix`. When contributing code, comply to commitizen commitlint format. For more guidelines, refer to `CONTRIBUTING.md`.
