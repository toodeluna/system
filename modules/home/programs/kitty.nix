{ lib, systemConfiguration, ... }:
{
  config = lib.mkIf systemConfiguration.syscfg.programs.kitty.enable {
    programs.kitty = {
      enable = true;
    };
  };
}
