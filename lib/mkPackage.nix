{ nixpkgs, ... }: system: path: nixpkgs.legacyPackages.${system}.callPackage (import path) { }
