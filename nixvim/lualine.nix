{
  programs.nixvim.plugins.lualine = {
    enable = true;

    settings = {
      options = {
        disabled_filetypes = {
          statusline = [ "neo-tree" ];
          winbar = [ "neo-tree" ];
        };
      };

      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [
          "branch"
          "diagnostics"
        ];
        lualine_c = [ "filename" ];
        lualine_x = [ "searchcount" ];
        lualine_y = [ "selectioncount" ];
        lualine_z = [ "location" ];
      };
    };
  };
}
