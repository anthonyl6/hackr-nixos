{pkgs, ...}: {
  home.packages = with pkgs; [
    # nil
    # nixfmt
    # gcc
    # gnumake
    # nodejs
    # jdk
    # minio-client
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Anthony Loria";
        email = "anthony@anthonyloria.dev";
      };
    };
  };

  programs.direnv = {
    enable = true;
    enableNushellIntegration = true;
  };
}
