{ pkgs, ... }:
{
  programs.bat = {
    enable = true;
    config = {
      theme = "base16";
    };
  };

  home.shellAliases = {
    cat = "${pkgs.bat}/bin/bat";
  };
}
