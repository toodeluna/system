{ config, pkgs, ... }:
{
  home.stateVersion = "24.05";
  home.username = "luna";
  home.homeDirectory = "/home/luna";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Luna Heyman";
    userEmail = "luna.heyman@proton.me";
    aliases = {
      lga = "log --graph --oneline --all --decorate";
      put = "push --set-upstream";
      rollback = "reset --hard HEAD";
    };
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
