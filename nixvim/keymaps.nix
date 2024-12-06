{
  programs.nixvim.keymaps = [
    {
      key = "<leader>q";
      mode = "n";
      action = ":exit<CR>";
    }
    {
      key = "<C-h>";
      mode = "n";
      action = "<C-W>h";
    }
    {
      key = "<C-j>";
      mode = "n";
      action = "<C-W>j";
    }
    {
      key = "<C-k>";
      mode = "n";
      action = "<C-W>k";
    }
    {
      key = "<C-l>";
      mode = "n";
      action = "<C-W>l";
    }
  ];
}
