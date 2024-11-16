{ pkgs, ... }:
{
  imports = [ ./programs ];

  home.username = "luna";
  home.stateVersion = "24.05";
  home.homeDirectory = if pkgs.stdenv.isLinux then "/home/luna" else "/Users/luna";

  programs.home-manager.enable = true;
}
