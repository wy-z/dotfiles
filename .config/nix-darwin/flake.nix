{
  description = "Darwin system flake";

  # the nixConfig here only affects the flake itself, not the system configuration!
  nixConfig = {
    substituters = [
      # Query the mirror of USTC first, and then the official cache.
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];
  };

  # This is the standard format for flake.nix. `inputs` are the dependencies of the flake,
  # Each item in `inputs` will be passed as a parameter to the `outputs` function after being pulled and built.
  inputs = {
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-23.11-darwin";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
  };

  # The `outputs` function will return all the build results of the flake.
  # A flake can have many use cases and different types of outputs,
  # parameters in `outputs` are defined in `inputs` and can be referenced by their names.
  # However, `self` is an exception, this special parameter points to the `outputs` itself (self-reference)
  # The `@` syntax here is used to alias the attribute set of the inputs's parameter, making it convenient to use inside the function.
  outputs = inputs @ {
    self,
    nixpkgs,
    darwin,
    ...
  }: let
    hostname = "MacBookPro@Ones";
    platform = "aarch64-darwin";
    configuration = {pkgs, ...}: {
      nixpkgs.hostPlatform = platform;
      # enable flakes globally
      nix.settings.experimental-features = ["nix-command" "flakes"];
      # fix untrusted substituter wraning
      nix.settings.trusted-substituters = ["https://mirrors.ustc.edu.cn/nix-channels/store"];
      # enable /etc/zshrc config
      programs.zsh.enable = true;

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      nix.package = pkgs.nix;
      programs.nix-index.enable = true;
    };
  in {
    darwinConfigurations."${hostname}" = darwin.lib.darwinSystem {
      system = platform; # change this to "aarch64-darwin" if you are using Apple Silicon
      modules = [
        configuration
        ./modules/app.nix
      ];
    };
  };
}
