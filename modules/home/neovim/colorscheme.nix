{ lib, systemConfiguration, ... }:
{
  programs.nixvim.colorschemes.base16 = {
    enable = true;
    colorscheme = lib.mapAttrs (_: value: "#${value}") systemConfiguration.syscfg.theme.colorscheme;
  };
}
