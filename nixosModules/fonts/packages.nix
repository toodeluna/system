{ pkgs, ... }:
let
  jetbrains-mono-nerdfont = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
in
{
  fonts.packages = with pkgs; [
    work-sans
    jetbrains-mono
    jetbrains-mono-nerdfont
    noto-fonts-cjk-sans
  ];
}
