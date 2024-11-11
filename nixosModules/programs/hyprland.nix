{ lib, config, ... }:
{
  options = {
    syscfg.programs.hyprland.enable = lib.mkEnableOption "hyprland";
  };

  config = lib.mkIf config.syscfg.programs.hyprland.enable {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    environment.sessionVariables = {
      NIXOS_OZONE_WL = 1;
    };
  };
}
