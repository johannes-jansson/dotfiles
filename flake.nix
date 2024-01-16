{
  description = "Home Manager Configurations, blatantly stolen from AxelTLarsson";

  inputs = {
    nixpkgs.url = "github:NixOS/Nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs = { self, nixpkgs, home-manager, flake-utils }:
    # home-manager and nixOS configuration
    {
      homeConfigurations = {
        "fruit" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;
          modules = [ ./nix/fruit.nix ];
        };
        "jixos" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [ ./nix/jixos.nix ];
        };
      };
    }
    # devShells
    // flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        update = pkgs.writeScriptBin "update" "nix flake update --commit-lock-file";
        build = pkgs.writeShellApplication {
          name = "build";
          runtimeInputs = [ pkgs.nvd pkgs.home-manager ];
          text = ''
            # first run: no current generation exists so use ./result (diff against oneself)
            current=$( (home-manager generations 2> /dev/null || echo result) | head -n 1 | awk '{ print $7 }')
            home-manager build --flake ".#$(hostname -s | awk '{ print tolower($1) }')" && nvd diff "$current" result
          '';
        };
        switch = pkgs.writeShellApplication {
          name = "switch";
          runtimeInputs = [ pkgs.home-manager ];
          text = ''
            home-manager switch --flake ".#$(hostname -s | awk '{ print tolower($1) }')"'';
        };
      in {
        devShell = pkgs.mkShell { buildInputs = [ update build switch ]; };
      });
}
