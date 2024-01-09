{
  pkgs,
  home-manager,
  ...
}: let
  username = "weiyang";
in {
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users."${username}" = {pkgs, ...}: {
    home.stateVersion = "23.11";
    programs.atuin = {
      enable = true;
      settings = {
        search_mode = "skim";
      };
    };
  };
}
