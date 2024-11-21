{
  imports = [
    ./colorscheme.nix
    ./lualine.nix
    ./lsp.nix
    ./treesitter.nix
    ./conform.nix
    ./neo-tree.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimdiffAlias = true;
    viAlias = true;
    vimAlias = true;

    globals = {
      mapleader = " ";
    };

    opts = {
      wrap = false;
      scrolloff = 20;

      number = true;
      relativenumber = true;

      shiftwidth = 4;
      tabstop = 4;
      expandtab = false;
      list = true;
      smartindent = true;

      swapfile = false;
      backup = false;
      undofile = false;

      hlsearch = false;
      incsearch = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>q";
        action.__raw = "vim.cmd.exit";
      }
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-W>h";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-W>j";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-W>k";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-W>l";
      }
    ];

    files."ftplugin/nix.lua" = {
      localOpts = {
        expandtab = true;
        shiftwidth = 2;
        tabstop = 2;
      };
    };
  };
}
