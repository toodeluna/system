{ lib, systemConfiguration, ... }:
{
  config = lib.mkIf systemConfiguration.syscfg.programs.fish.enable {
    programs.fish = {
      enable = true;
      interactiveShellInit = "fish_vi_key_bindings";
    };
  };
}
