{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    syscfg.programs.steam.enable = lib.mkEnableOption "steam";
  };

  config = lib.mkIf config.syscfg.programs.steam.enable {
    programs.gamemode.enable = true;

    programs.steam = {
      enable = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };

    programs.gamescope = {
      enable = true;
      capSysNice = true;
    };

    environment.systemPackages = with pkgs; [ r2modman ];
  };
}
