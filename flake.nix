{
  description = "Home Manager configuration of taiseiue";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      mkHome =
        system: module:
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [ module ];
        };
    in
    {
      homeConfigurations = {
        "taiseiue@lily" = mkHome "aarch64-darwin" ./machines/lily.nix;
        "taiseiue@linux" = mkHome "x86_64-linux" ./layers/linux.nix;
      };
    };
}
