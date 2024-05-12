{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nh
    nvd
    nix-output-monitor
  ];
}
