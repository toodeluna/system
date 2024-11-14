{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    syscfg.programs.stremio.enable = lib.mkEnableOption "stremio";
  };

  config = lib.mkIf config.syscfg.programs.stremio.enable {
    environment.systemPackages = [ pkgs.stremio ];
  };
}
