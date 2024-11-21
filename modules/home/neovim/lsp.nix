{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      servers = {
        nixd.enable = true;
      };
    };

    plugins.luasnip = {
      enable = true;
    };

    extraConfigLuaPre = ''
      local luasnip = require("luasnip")
    '';

    plugins.cmp = {
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
  };
}
