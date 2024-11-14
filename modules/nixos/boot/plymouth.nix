{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    syscfg.boot.plymouth.enable = lib.mkEnableOption "plymouth";
  };

  config = lib.mkIf config.syscfg.boot.plymouth.enable {
    boot.plymouth = {
      enable = true;
      theme = "plymouth-gif-theme";
      themePackages = [ pkgs.plymouth-gif-theme ];
    };
  };
}
