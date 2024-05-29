{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../modules/nixos
    ./specialisations
    ../overlays/test-overlay.nix
  ];
  nix = {
    trustedUsers = ["root" "zhonghengl" "@wheel"];
    settings.experimental-features = ["nix-command" "flakes"];
  };

  boot = {
    #  consoleLogLevel = 3;
    #  loader.grub.splashImage = ./bootsplash.png;
    #  kernelParams = [
    #    "quiet"
    #    "bgrt_disable"
    #    "udev.log-priority=3"
    #  ];
    kernelPackages = pkgs.linuxPackages_zen;
    #  plymouth = {
    #    enable = true;
    #    theme = "breeze";
    #  };
    #  initrd.systemd.enable = true;
  };
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-25.9.0" # for obsidian
      "openssl-1.1.1w" # for wechat-uos
    ];
  };
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    sane = {
      enable = true;
      extraBackends = with pkgs; [sane-airscan utsushi];
    };
  };
  users.users = {zhonghengl = {shell = pkgs.zsh;};};
  programs.zsh.enable = true;
  # rtkit is optional but recommended
  security.rtkit.enable = true;
  services = {auto-cpufreq.enable = true;};
  networking = {
    hostName = "nixos"; # Define your hostname.
    networkmanager.enable = true;
  };
  # Set your time zone.
  time.timeZone = "Europe/Athens";

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  users.users.zhonghengl = {
    isNormalUser = true;
    description = "Zhongheng Liu";
    extraGroups = ["networkmanager" "wheel"];
  };
  environment = {
    systemPackages = with pkgs; [devenv];
    variables = {
      FLAKE = "/home/${config.users.users.zhonghengl.name}/dotfiles";
      EDITOR = "nvim";
    };
  };
  system.stateVersion = "23.11"; # Did you read the comment?
}
