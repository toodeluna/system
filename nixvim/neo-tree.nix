{
  programs.nixvim = {
    plugins = {
      web-devicons.enable = true;

      neo-tree = {
        enable = true;
        closeIfLastWindow = true;
      };
    };

    keymaps = [
      {
        key = "<leader>ft";
        mode = "n";
        action = ":Neotree toggle<CR>";
      }
    ];
  };
}
