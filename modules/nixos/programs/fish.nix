{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    syscfg.programs.fish.enable = lib.mkEnableOption "fish shell";
  };

  config = lib.mkIf config.syscfg.programs.fish.enable {
    programs.fish.enable = true;
    users.defaultUserShell = pkgs.fish;
  };
}
