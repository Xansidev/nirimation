{
  description = "Nirimation - custom shader animations for the Niri Wayland compositor";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      packages = forAllSystems (pkgs: rec {
        nirimation = pkgs.callPackage ./nix/package.nix { };
        default = nirimation;
      });

      overlays.default = final: _prev: {
        nirimation = final.callPackage ./nix/package.nix { };
      };

      homeManagerModules = rec {
        nirimation = import ./nix/hm-module.nix self;
        default = nirimation;
      };
      homeModules = self.homeManagerModules;

      formatter = forAllSystems (pkgs: pkgs.nixfmt);
    };
}
