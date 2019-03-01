{ pkgs ? import <nixpkgs> {} }:
let
  overrides = self: super: {
    mkDerivation = args: super.mkDerivation (args // { doCheck = false; });
  };
  p = pkgs.haskell.packages.ghcjs86.override { inherit overrides; };
in
  p.callPackage ./pkg.nix {}

