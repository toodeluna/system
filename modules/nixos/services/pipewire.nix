{ lib, config, ... }:
{
  options = {
    syscfg.services.pipewire.enable = lib.mkEnableOption "pipewire";
  };

  config = lib.mkIf config.syscfg.services.pipewire.enable {
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      jack.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
    };
  };
}
