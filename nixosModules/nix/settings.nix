{
  nix.settings = {
    auto-optimise-store = true;
    allowed-users = [ "@wheel" ];
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
