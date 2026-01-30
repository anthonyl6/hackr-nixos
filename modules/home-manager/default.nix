{
  inputs,
  system,
  config,
  ...
}: {
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      inherit system;
      hostname = config.networking.hostName;
    };
    users = {
      "tony" = import ./links.nix;
    };
    backupFileExtension = "bak";
  };
}
