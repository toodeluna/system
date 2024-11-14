{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    syscfg.programs.spotify.enable = lib.mkEnableOption "spotify";
  };

  config = lib.mkIf config.syscfg.programs.spotify.enable {
    environment.systemPackages = [ pkgs.spotify ];
  };
}
