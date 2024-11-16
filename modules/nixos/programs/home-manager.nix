{ config, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      systemConfiguration = config;
    };
  };
}
