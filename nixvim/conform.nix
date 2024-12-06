{ pkgs, ... }:
{
  programs.nixvim.extraPackages = with pkgs; [
    deno
    nixfmt-rfc-style
  ];

  programs.nixvim.plugins.conform-nvim = {
    enable = true;

    settings = {
      formatters_by_ft = {
        nix = [ "nixfmt" ];
        json = [ "deno_fmt" ];
      };

      format_on_save = {
        lsp_format = "fallback";
      };
    };
  };
}
