{
  pkgs,
  lib,
  inputs,
  system,
  ...
}: {
  security.polkit.enable = true;

  environment.systemPackages = with pkgs; [
    wl-clipboard # Copy/Paste functionality.
    mako # Notification utility.
  ];

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  services.gnome.gnome-keyring.enable = true;

  services.displayManager.defaultSession = lib.mkForce "sway";
}
