{
  config,
  libs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    nodejs
    python3
    maven
  ];
}
