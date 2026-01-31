{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    # ... other inputs
  };

  outputs = { nixpkgs, ... } @ inputs: {

    nixosConfigurations = builtins.listToAttrs (map (name: {
      name = name;
      value = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/${name}

          # Module to disable xdg-desktop-portal tests and move build dir
          ({ config, pkgs, ... }: {

            nixpkgs.overlays = [
              (final: prev: {
                xdg-desktop-portal = prev.xdg-desktop-portal.overrideAttrs (_: {
                  doCheck = false;
                });
              })
            ];

            # Set Nix build temp dir to another drive (example: /mnt/bigdrive/nix-build)
            nix.settings = {
              build-dir = "/mnt/ssd/nix-build";
              max-jobs = "auto";
              cores = 0;
              keep-outputs = false;
              keep-derivations = false;
            };
          })
        ];
      };
    }) ["coco"]);
  };
}
