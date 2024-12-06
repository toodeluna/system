{ pkgs, ... }:
{
  programs.nixvim.plugins.treesitter = {
    enable = true;

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      nix
      toml
      json
    ];
  };
}
