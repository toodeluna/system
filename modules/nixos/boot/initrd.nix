{ lib, config, ... }:
{
  boot.initrd = {
    verbose = false;
    kernelModules = lib.mkIf (config.syscfg.hardware.graphics.gpu == "amd") [ "amdgpu" ];
  };
}
