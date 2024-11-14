{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    syscfg.programs.discord.enable = lib.mkEnableOption "discord";
  };

  config = lib.mkIf config.syscfg.programs.discord.enable {
    environment.systemPackages = [ pkgs.discord ];
  };
}
