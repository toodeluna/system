{
  self,
  pkgs,
  config,
  ...
}:
{
  services.nix-daemon.enable = true;

  nixpkgs.hostPlatform = "aarch64-darwin";
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = 5;
  system.configurationRevision = self.rev or self.dirtyRev or null;

  programs.fish.enable = true;
  environment.shells = [ pkgs.fish ];

  users.knownUsers = [ "luna" ];
  users.users.luna = {
    uid = 501;
    description = "Luna Heyman";
    home = "/Users/luna";
    shell = pkgs.fish;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.luna = import ./home.nix;
  };

  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    autoMigrate = true;
    user = "luna";
  };

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    casks = [
      "zen-browser"
      "microsoft-teams"
      "spotify"
    ];
  };

  environment.systemPackages = with pkgs; [
    mkalias
    nodejs_18
    pnpm
    vscode
    alacritty
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Iosevka" ]; })
  ];

  system.activationScripts.applications.text =
    let
      env = pkgs.buildEnv {
        name = "system-application";
        paths = config.environment.systemPackages;
        pathsToLink = "/Applications";
      };
    in
    pkgs.lib.mkForce ''
      echo "Setting up /Applications..." >&2
      rm -rf /Applications/Nix\ Apps
      mkdir -p /Applications/Nix\ Apps
      find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      while read src; do
        app_name=$(basename "$src")
        echo "Copying $src" >&2
        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
      done
    '';
}
