{ lib, config, ... }:
{
  options = {
    syscfg.hardware.graphics.gpu = lib.mkOption {
      description = "The GPU type used by the system.";
      default = "intel";
      type = lib.types.enum [
        "amd"
        "intel"
      ];
    };
  };

  config = lib.mkIf (config.syscfg.hardware.graphics.gpu == "amd") {
    services.xserver.videoDrivers = [ "amdgpu" ];

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
