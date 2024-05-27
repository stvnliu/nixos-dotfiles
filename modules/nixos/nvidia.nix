{
  config,
  lib,
  ...
}: let
  cfg = config.nvidiaModule;
in {
  options.nvidiaModule = {
    enable = lib.mkEnableOption "Whether to enable the nvidia module";
    usePowersave = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = ''Whether to include a power-saving nvidia-offload specialisation.'';
    };
  };
  config = lib.mkIf cfg.enable {
    specialisation = lib.mkIf cfg.usePowersave {
      powersave.configuration = {
        hardware.nvidia.prime = {
          offload = {
            enable = lib.mkForce true;
            enableOffloadCmd = lib.mkForce true;
          };
          sync.enable = lib.mkForce false;
        };
      };
    };
    hardware.nvidia = {
      prime = {
        offload.enable = false;
        sync = {
          enable = true;
        };
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
      forceFullCompositionPipeline = true;
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}
