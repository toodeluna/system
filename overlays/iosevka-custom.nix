final: prev:
let
  iosevka-custom-base = prev.iosevka.override {
    set = "Custom";

    privateBuildPlan = {
      family = "Iosevka Custom";
      spacing = "normal";
      serifs = "sans";
      noCvSs = true;
      exportGlyphNames = false;
      noLigation = true;

      variants = {
        inherits = "ss14";

        design = {
          asterisk = "hex-low";
          ascii-grave = "straight";
          paren = "normal";
          number-sign = "upright";
          ampersand = "et-toothed";
          at = "fourfold";
          dollar = "open";
          cent = "open";
        };
      };

      weights = {
        Regular = {
          shape = 400;
          menu = 400;
          css = 400;
        };

        ExtraBold = {
          shape = 800;
          menu = 800;
          css = 800;
        };
      };

      widths = {
        Condensed = {
          shape = 500;
          menu = 3;
          css = "condensed";
        };

        Normal = {
          shape = 600;
          menu = 5;
          css = "normal";
        };
      };

      slopes = {
        Upright = {
          angle = 0;
          shape = "upright";
          menu = "upright";
          css = "normal";
        };

        Italic = {
          angle = 9.4;
          shape = "italic";
          menu = "italic";
          css = "italic";
        };
      };
    };
  };
in
{
  iosevka-custom = prev.stdenv.mkDerivation {
    name = "iosevka-custom";
    src = iosevka-custom-base;
    buildInputs = [
      iosevka-custom-base
      prev.nerd-font-patcher
    ];

    buildPhase = ''
      find \( -name \*.ttf -o -name \*.otf \) -execdir nerd-font-patcher -c {} \;
    '';

    installPhase = ''
      cp -a . $out
    '';
  };
}
