{
  programs.nixvim.plugins.luasnip.enable = true;

  programs.nixvim.extraConfigLuaPre = ''
    local luasnip = require("luasnip")
  '';

  programs.nixvim.plugins.lsp = {
    enable = true;
    servers.nixd.enable = true;
  };

  programs.nixvim.plugins.cmp = {
    enable = true;
    autoEnableSources = true;

    settings = {
      sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
      ];

      mapping = {
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<S-Tab>" = "cmp.mapping.select_prev_item()";
        "<Tab>" = ''
          function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end
        '';
      };
    };
  };
}
