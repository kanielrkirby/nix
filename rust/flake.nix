{
  description = "Nix shell for Rust";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    flakelight.url = "github:nix-community/flakelight";
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.flakelight ./. ({ lib, ... }: {
      inherit inputs;
      devShell = pkgs: {
        packages = with pkgs; [
          # Base
          (inputs.fenix.packages.${system}.fromToolchainFile {
            dir = ./.;
            sha256 = "sha256-kqVEKNnxmT12N+hnLQQ84MXDmJvxSD6OIFTU4iaI5TI=";
          })

          # Cargo packages
          cargo-binstall
          cargo-cross
          cargo-docset
          cargo-flamegraph
          cargo-generate
          cargo-information
          cargo-make
          cargo-mutants
          cargo-rdme
          cargo-shear
          cargo-tarpaulin
          cargo-watch
          cargo-whatfeatures

          # Cargo web packages
          cargo-leptos 
          cargo-wasi 
          cargo-tauri

          # Miscellaneous
          bacon
          evcxr
          gnumake
          lldb
          mold
          sccache
        ];
        # inputsFrom = [];
        # shellHook = '''';
        # env = {};
        # stdenv = pkgs.;
      };
    });
}
