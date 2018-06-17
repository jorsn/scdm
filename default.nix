{ pkgs ? import <nixpkgs> {} }:

pkgs.callPackage ./scdm.nix {}
