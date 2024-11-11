{ lib, config, ... }:
{
  options = {
    syscfg.services.ly.enable = lib.mkEnableOption "ly display manager";
  };

  config = lib.mkIf config.syscfg.services.ly.enable {
    services.displayManager.ly = {
      enable = true;
      settings = {
        vi_mode = true;
        clear_password = true;
        clock = "%D %H:%M";
      };
    };
  };
}
