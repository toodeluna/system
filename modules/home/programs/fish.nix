{ lib, systemConfiguration, ... }:
{
  config = lib.mkIf systemConfiguration.syscfg.programs.fish.enable {
    programs.fish = {
      enable = true;
    };
  };
}
