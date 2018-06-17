{ pkgs ? import <nixpkgs> {} }:

pkgs.callPackage ./nix/scdm.nix {}
