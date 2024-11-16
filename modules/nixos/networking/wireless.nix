{
  lib,
  config,
  ...
}:
{
  options = {
    syscfg.networking.wireless.enable = lib.mkEnableOption "wifi";
  };

  config = lib.mkIf config.syscfg.networking.wireless.enable {
    networking.wireless.iwd.enable = true;
  };
}
