{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    syscfg.programs.nh.flake = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
    };
  };

  config = {
    programs.nh = {
      enable = true;
      flake = config.syscfg.programs.nh.flake;
      clean.enable = true;
    };
  };
}
