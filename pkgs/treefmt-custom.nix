{ pkgs, lib }:
let
  formatters = with pkgs; [
    deno
    nixfmt-rfc-style
  ];
in
pkgs.treefmt.overrideAttrs (prev: {
  nativeBuildInputs = prev.nativeBuildInputs ++ [ pkgs.makeWrapper ];

  postFixup = ''
    wrapProgram $out/bin/treefmt --set PATH ${lib.makeBinPath formatters}
  '';
})
