
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
          cpu = 4;
          disk = 100;
          memory = 4;
          #arch = "aarch64";
          runtime = "docker";
          modelRunner = "docker";
          hostname = null;
          kubernetes = {
            enabled = false;
            version = "v1.33.3+k3s1";
            k3sArgs = [ "--disable=traefik" ];
            port = 0;
          };
          autoActivate = true;
          network = {
            address = false;
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
          vmType = "qemu";
          portForwarder = "ssh";
          rosetta = false;
          binfmt = true;
          nestedVirtualization = false;
          mountType = "sshfs";
          mountInotify = false;
          cpuType = "host";
          provision = [ ];
          sshConfig = true;
          sshPort = 0;
          mounts = [ ];
          diskImage = "";
          rootDisk = 20;
          env = { };
        };
      };
      x86_64 = {
        settings = {
          cpu = 4;
          disk = 100;
          memory = 4;
          arch = "x86_64";
          runtime = "docker";
          modelRunner = "docker";
          hostname = null;
          kubernetes = {
            enabled = false;
            version = "v1.33.3+k3s1";
            k3sArgs = [ "--disable=traefik" ];
            port = 0;
          };
          autoActivate = true;
          network = {
            address = false;
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
          vmType = "qemu";
          portForwarder = "ssh";
          rosetta = false;
          binfmt = true;
          nestedVirtualization = false;
          mountType = "sshfs";
          mountInotify = false;
          cpuType = "host";
          provision = [ ];
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
