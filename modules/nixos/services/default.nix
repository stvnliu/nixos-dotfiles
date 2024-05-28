{...}: {
  imports = [
    ./avahi.nix
    ./misc.nix
    #./mysql.nix
    ./openvpn.nix
    ./pipewire.nix
    ./printing.nix
    ./static-web-server.nix
    ./ferretdb.nix
    ./syncthing.nix
  ];
}
