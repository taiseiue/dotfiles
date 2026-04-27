{
  description = "Home Manager configuration of taiseiue";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, nixpkgs-stable, home-manager, ... }:
    let
      mkHome =
        system: module:
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;
            overlays = [
              (final: prev: {
                wezterm = nixpkgs-stable.legacyPackages.${system}.wezterm;
              })
            ];
          };
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
