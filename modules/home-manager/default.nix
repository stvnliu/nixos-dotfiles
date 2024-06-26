{lib, ...}: {
  imports = [
    ./misc.nix
    ./tex.nix
    ./utils.nix
    ./gtk.nix
    ./spicetify.nix
    ./desktop
    ./editors
    ./terminals
    ./shells
  ];
  config = {
    editors = {
      vscode.enable = true;
    };
    shells = {
      enable = true;
      useZsh = true;
    };
  };
}
