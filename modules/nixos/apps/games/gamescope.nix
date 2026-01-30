{
  config,
  ...
}: {
  programs.gamescope = {
    enable = builtins.elem config.networking.hostName ["coco"];
    capSysNice = true;
  };
}
