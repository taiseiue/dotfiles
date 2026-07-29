{
  config,
  pkgs,
  lib,
  ...
}:
{
  services.colima = {
    enable = true;
    profiles = {
      default = {
        settings = {
          cpu = 6;
          disk = 100;
          memory = 8;
          runtime = "docker";
          modelRunner = "docker";
          hostname = null;
          kubernetes = {
            enabled = false;
          };
          autoActivate = true;
          network = {
            address = true;
            mode = "shared";
            interface = "en0";
            preferredRoute = false;
            dns = [ ];
            dnsHosts = {
              "host.docker.internal" = "host.lima.internal";
            };
            hostAddresses = false;
          };
          forwardAgent = false;
          docker = { };
          vmType = "vz";
          portForwarder = "grpc";
          rosetta = true;
          binfmt = true;
          nestedVirtualization = false;
          mountType = "virtiofs";
          mountInotify = true;
          cpuType = "host";
          provision = [];
          sshConfig = true;
          sshPort = 0;
          mounts = [ ];
          diskImage = "";
          rootDisk = 20;
          env = { };
        };
      };
    };
  };
  home.packages = with pkgs; [
    docker
  ];
  home.sessionVariables = {
    COLIMA_SAVE_CONFIG = 0;
  };
}
