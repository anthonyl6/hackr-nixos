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

  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
  };

  services.displayManager.defaultSession = lib.mkForce "xfce";
}
