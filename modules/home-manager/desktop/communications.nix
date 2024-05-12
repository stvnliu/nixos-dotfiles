{
  config,
  libs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    discord
    teams-for-linux
    qq
  ];
}
