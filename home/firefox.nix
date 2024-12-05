{ theme, ... }:
{
  programs.firefox = {
    enable = true;

    profiles.luna = {
      name = "Luna";

      settings = {
        "devtools.chrome.enabled" = true;
        "devtools.debugger.remote-enabled" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };

      userChrome = with theme; ''
        .urlbarView-row[selected] {
          background: #${base02} !important;
        }
      '';
    };
  };
}
