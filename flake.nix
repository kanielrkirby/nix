{
  description = "A flake with the script to for `nxdv`, to start common devShells easily.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flakelight.url = "github:nix-community/flakelight";
    flake-compat.url = "https://flakehub.com/f/edolstra/flake-compat/1.tar.gz";
  };

  outputs = inputs:
    inputs.flakelight ./. ({ lib, ... }: {
      systems = lib.systems.flakeExposed;
      package = pkgs: pkgs.writeScriptBin "nxdv" (builtins.readFile ./nxdv.sh);
    });
}
