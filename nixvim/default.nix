{
  imports = [
    ./colorscheme.nix
    ./lualine.nix
    ./neo-tree.nix
    ./options.nix
    ./keymaps.nix
    ./treesitter.nix
    ./conform.nix
    ./lsp.nix
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;

    globals = {
      mapleader = " ";
    };

    files."ftplugin/nix.lua" = {
      opts = {
        expandtab = true;
        shiftwidth = 2;
        tabstop = 2;
      };
    };
  };
}
