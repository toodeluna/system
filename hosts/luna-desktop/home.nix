{
  imports = [ ../../home ];

  home = {
    username = "luna";
    homeDirectory = "/home/luna";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
