{
  pkgs,
  ...
}: {
  imports = [
    ../../modules/nixos
    ./hardware-configuration.nix
    ./boot.nix
  ];

  networking.hostName = "coco";

  nix.settings = {
    # Enable flakes
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    # Build performance
    build-dir = "/mnt/ssd/nix-build"; # <-- move build dir to another drive
    max-jobs = "auto";
    cores = 0;

    # Reduce disk usage
    keep-outputs = false;
    keep-derivations = false;
    auto-optimise-store = true;

    # Binary cache (prevents massive local builds)
    substituters = [
      "https://cache.nixos.org"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
  };

  environment.systemPackages = with pkgs; [
    wget
    curl
  ];

  system.stateVersion = "24.11";
}
