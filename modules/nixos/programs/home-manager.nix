{ config, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hmbackup";
    extraSpecialArgs = {
      systemConfiguration = config;
    };
  };
}
