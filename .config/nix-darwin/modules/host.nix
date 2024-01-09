{...}: let
  raw_hostname = "MacBookProOnes";
  username = "weiyang";
in {
  networking.hostName = raw_hostname;
  networking.computerName = raw_hostname;
  system.defaults.smb.NetBIOSName = raw_hostname;

  users.users."${username}" = {
    home = "/Users/${username}";
  };
  nix.settings.trusted-users = [username];
}
