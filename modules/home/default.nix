{ pkgs, systemConfiguration, ... }:
{
  imports = [
    ./aliases.nix
    ./programs
  ];

  home.username = "luna";
  home.stateVersion = "24.05";
  home.homeDirectory = if pkgs.stdenv.isLinux then "/home/luna" else "/Users/luna";

  gtk = {
    enable = true;
    cursorTheme = systemConfiguration.syscfg.theme.cursor;
  };

  xresources.properties = {
    "Xcursor.theme" = systemConfiguration.syscfg.theme.cursor.name;
  };

  programs.home-manager.enable = true;
}
