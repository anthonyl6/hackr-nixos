{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.default
    ../../home-manager/default.nix
  ];
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tony = {
    isNormalUser = true;
    description = "Anthony Loria";
    shell = pkgs.nushell;
    openssh.authorizedKeys.keyFiles = [
      ../../../ssh/authorized_keys
    ];
  };

  # Enable automatic login for the user.
  services = {
    displayManager.autoLogin.enable = true;
    displayManager.autoLogin.user = "tony";
  };
}
