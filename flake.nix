{
  description = "elastic kibana";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-21.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, flake-utils }:
    let
      localOverlay = import ./nix/overlay.nix;
      unstable = final: prev: {
        unstable = import nixpkgs-unstable {
          inherit (prev.stdenv) system;
        };
      };
      overlays = [ localOverlay unstable ];
    in flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system overlays;
        };
      in {
        legacyPackages = pkgs;
        inherit (pkgs) devShell;
      }) // {
        # platform independent attrs
        overlay = final: prev: (nixpkgs.lib.composeManyExtensions overlays) final prev;
        inherit overlays;
      };
}
