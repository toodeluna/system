{ pkgs, config, ... }:
{
  fonts.packages = with pkgs; [
    noto-fonts-cjk-sans
    config.syscfg.theme.fonts.monospace.package
    config.syscfg.theme.fonts.gui.package
  ];
}
